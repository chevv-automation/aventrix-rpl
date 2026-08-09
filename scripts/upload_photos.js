require('dotenv').config();
const { Client } = require('pg');
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');
const mime = require('mime-types'); // We'll install this too if needed, or just guess based on extension

const supabaseUrl = process.env.SUPABASE_API_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE;
const dbUrl = process.env.SUPABASE_CONNECT;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function run() {
    console.log("1. Adding foto_url column to database...");
    const pgClient = new Client({ connectionString: dbUrl });
    try {
        await pgClient.connect();
        await pgClient.query(`ALTER TABLE profiles ADD COLUMN IF NOT EXISTS foto_url TEXT NULL;`);
        console.log("Column foto_url added successfully.");
    } catch (e) {
        console.error("Failed to add column:", e);
    } finally {
        await pgClient.end();
    }

    console.log("2. Setting up storage bucket...");
    const { data: buckets, error: bucketListError } = await supabase.storage.listBuckets();
    if (bucketListError) throw bucketListError;

    let bucket = buckets.find(b => b.name === 'siswa-avatars');
    if (!bucket) {
        const { data, error } = await supabase.storage.createBucket('siswa-avatars', {
            public: true,
            allowedMimeTypes: ['image/png', 'image/jpeg', 'image/jpg', 'image/webp'],
            fileSizeLimit: 5242880 // 5MB
        });
        if (error) {
            console.error("Error creating bucket:", error);
            return;
        }
        console.log("Bucket 'siswa-avatars' created successfully.");
    } else {
        console.log("Bucket 'siswa-avatars' already exists. Making sure it's public...");
        await supabase.storage.updateBucket('siswa-avatars', { public: true });
    }

    console.log("3. Scanning images folder...");
    const imagesDir = path.join(__dirname, 'images');
    if (!fs.existsSync(imagesDir)) {
        console.error("Directory not found:", imagesDir);
        return;
    }

    const files = fs.readdirSync(imagesDir);
    let uploadedCount = 0;

    for (const file of files) {
        const ext = path.extname(file);
        const nameWithoutExt = path.basename(file, ext);
        // Extracts the first number from the filename
        const match = nameWithoutExt.match(/(\d+)/);
        if (!match) {
            console.log("Skipping file (no number found):", file);
            continue;
        }
        const nomor_absen = parseInt(match[1], 10);
        
        const filePath = path.join(imagesDir, file);
        const fileBuffer = fs.readFileSync(filePath);
        const standardName = `siswa-${nomor_absen}${ext.toLowerCase()}`;
        
        // guess mime type manually since we don't have mime-types package
        let contentType = 'image/jpeg';
        if (ext.toLowerCase() === '.png') contentType = 'image/png';
        if (ext.toLowerCase() === '.webp') contentType = 'image/webp';

        console.log(`Uploading ${file} as ${standardName} for absen ${nomor_absen}...`);
        
        const { data: uploadData, error: uploadError } = await supabase.storage
            .from('siswa-avatars')
            .upload(standardName, fileBuffer, {
                contentType,
                upsert: true
            });

        if (uploadError) {
            console.error(`Failed to upload ${file}:`, uploadError);
            continue;
        }

        const { data: publicUrlData } = supabase.storage
            .from('siswa-avatars')
            .getPublicUrl(standardName);
        
        const publicUrl = publicUrlData.publicUrl;

        console.log(`Updating database for absen ${nomor_absen} with URL ${publicUrl}...`);
        const { error: updateError } = await supabase
            .from('profiles')
            .update({ foto_url: publicUrl })
            .eq('nomor_absen', nomor_absen);

        if (updateError) {
            console.error(`Failed to update DB for absen ${nomor_absen}:`, updateError);
        } else {
            uploadedCount++;
        }
    }
    console.log(`Successfully uploaded and updated ${uploadedCount} photos.`);
}

run().catch(console.error);
