const fs = require('fs');
const csv = require('csv-parser');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://hcsrowlwbngnhyhrwvep.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhjc3Jvd2x3Ym5nbmh5aHJ3dmVwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc4NjAxMjUyNywiZXhwIjoyMTAxNTg4NTI3fQ.Snp4EeW6GjCCkgOn8uNHP6lsmQbQHoWDmT5H4Lr96oE';
const supabase = createClient(supabaseUrl, supabaseKey);

const csvFilePath = path.join(__dirname, 'new', 'Data Siswa XII RPL-Grid view (1).csv');
const rows = [];

fs.createReadStream(csvFilePath)
    .pipe(csv())
    .on('data', (row) => {
        const keys = Object.keys(row);
        let nomor_absen = parseInt(row[keys[0]], 10);
        let hobi = row['Hobi'];
        let kata_motivasi = row['Kata Motivasi'];
        if (nomor_absen) {
            rows.push({ nomor_absen, hobi, kata_motivasi });
        }
    })
    .on('end', async () => {
        console.log(`Read ${rows.length} rows. Updating database...`);
        let count = 0;
        for (const row of rows) {
            const { error } = await supabase
                .from('profiles')
                .update({ hobi: row.hobi, kata_motivasi: row.kata_motivasi })
                .eq('nomor_absen', row.nomor_absen);
            
            if (error) {
                console.error(`Error updating nomor_absen ${row.nomor_absen}:`, error);
            } else {
                count++;
            }
        }
        console.log(`Successfully updated ${count} rows.`);
    });
