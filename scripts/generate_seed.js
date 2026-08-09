const fs = require('fs');
const csv = require('csv-parser');
const path = require('path');

const csvFilePath = path.join(__dirname, 'Data Siswa XII RPL-Grid view.csv');
const sqlFilePath = path.join(__dirname, 'seed_profiles.sql');

function escapeSql(val) {
    if (val === null || val === undefined || val === '') return 'NULL';
    // escape single quotes
    return "'" + String(val).replace(/'/g, "''") + "'";
}

const statements = [];

// Adding new ENUM values to prevent errors
statements.push(`ALTER TYPE user_role_enum ADD VALUE IF NOT EXISTS 'Sekretaris';`);
statements.push(`ALTER TYPE user_role_enum ADD VALUE IF NOT EXISTS 'Bendahara';`);

fs.createReadStream(csvFilePath)
    .pipe(csv())
    .on('data', (row) => {
        let nomor_absen = parseInt(row['Nomor Absen'] || row['nomor absen'], 10);
        let nama = row['Nama Lengkap'] || row['nama'];
        let tempat_lahir = row['Tempat Lahir'] || row['tempat lahir'];
        let tanggal_lahir = row['Tanggal Lahir'] || row['tanggal lahir']; // YYYY-MM-DD
        let nomor_whatsapp = row['Nomor WhatsApp'] || row['nomor whatsapp'] || '';
        let email = row['Email'] || row['email'];
        let alamat_rumah = row['Alamat Rumah'] || row['alamat rumah'];
        let jabatan = row['Jabatan'] || row['jabatan'] || 'Anggota';
        let deskripsi_diri = row['Deskripsi Diri'] || row['deskripsi diri'];
        
        if (nomor_whatsapp.startsWith('8')) {
            nomor_whatsapp = '0' + nomor_whatsapp;
        }
        nomor_whatsapp = nomor_whatsapp.replace(/[^0-9+]/g, '');
        if (nomor_whatsapp.length > 20) {
            nomor_whatsapp = nomor_whatsapp.substring(0, 20);
        }

        if (jabatan === 'Sekretaris 1' || jabatan === 'Sekretaris 2') {
            jabatan = 'Sekretaris';
        } else if (jabatan === 'Bendahara 1' || jabatan === 'Bendahara 2') {
            jabatan = 'Bendahara';
        }

        const vals = [
            nomor_absen,
            escapeSql(nama),
            escapeSql(tempat_lahir),
            escapeSql(tanggal_lahir),
            escapeSql(nomor_whatsapp),
            escapeSql(email),
            escapeSql(alamat_rumah),
            escapeSql(jabatan),
            escapeSql(deskripsi_diri)
        ];

        const insertQuery = `
INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (${vals.join(', ')})
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;
`;
        statements.push(insertQuery.trim());
    })
    .on('end', () => {
        fs.writeFileSync(sqlFilePath, statements.join(';;;SPLIT_HERE;;;'));
        console.log(`Successfully generated seed_profiles.sql with ${statements.length - 2} records.`);
    })
    .on('error', (err) => {
        console.error("Error reading CSV:", err);
    });
