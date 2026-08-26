const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

const supabaseUrl = 'https://hcsrowlwbngnhyhrwvep.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhjc3Jvd2x3Ym5nbmh5aHJ3dmVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODYwMTI1MjcsImV4cCI6MjEwMTU4ODUyN30.cu75W_hVWvgrgpYI9MxF53P5KMte7MB8AbnArb_WI2Q';
const supabase = createClient(supabaseUrl, supabaseKey);

async function uploadPosters() {
    const posterDir = '/home/chevv/xii_rpl/poster';
    const files = fs.readdirSync(posterDir).filter(f => f.endsWith('.jpeg') || f.endsWith('.jpg') || f.endsWith('.png'));
    
    for (const file of files) {
        const filePath = path.join(posterDir, file);
        const fileContent = fs.readFileSync(filePath);
        
        console.log("Uploading " + file + "...");
        const { data, error } = await supabase
            .storage
            .from('posters')
            .upload(file, fileContent, {
                cacheControl: '3600',
                upsert: true,
                contentType: 'image/jpeg'
            });
            
        if (error) {
            console.error("Failed to upload " + file + ":", error.message);
        } else {
            console.log("Successfully uploaded " + file);
            const { data: pubData } = supabase.storage.from('posters').getPublicUrl(file);
            console.log("Public URL: " + pubData.publicUrl);
        }
    }
}

uploadPosters();
