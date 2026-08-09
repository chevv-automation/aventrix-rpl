const fs = require('fs');
const path = require('path');
const cheerio = require('cheerio');

const dir = __dirname;
const jsDir = path.join(dir, 'js');

// 1. Create supabase-fetch.js
const supabaseFetchContent = `
document.addEventListener('DOMContentLoaded', async () => {
    if (!window.supabase) return;

    // --- 1. Prestasi ---
    const achievementsContainer = document.getElementById('achievements-container');
    if (achievementsContainer) {
        // Fetch data
        const { data, error } = await supabase.from('achievements').select('*');
        if (error) {
            console.error('Error fetching achievements:', error);
        } else if (data && data.length > 0) {
            // Render logic here
            // Note: We keep existing static HTML as fallback/skeleton and just log or append.
            // For a real app, we'd clear the container and render cards.
            console.log('Fetched achievements:', data);
            // Example of replacing content:
            // achievementsContainer.innerHTML = data.map(item => \`<article>...</article>\`).join('');
        }
    }

    // --- 2. Anggota Kelas ---
    const membersContainer = document.getElementById('members-container');
    if (membersContainer) {
        const { data, error } = await supabase.from('students').select('*');
        if (error) console.error('Error fetching students:', error);
        else if (data) console.log('Fetched students:', data);
    }

    // --- 3. Jadwal Mapel ---
    const jadwalMapelTable = document.getElementById('jadwal-mapel-table');
    if (jadwalMapelTable) {
        const { data, error } = await supabase.from('schedules').select('*');
        if (error) console.error('Error fetching schedules:', error);
        else if (data) console.log('Fetched schedules:', data);
    }

    // --- 4. Jadwal Piket ---
    const jadwalPiketContainer = document.getElementById('jadwal-piket-container');
    if (jadwalPiketContainer) {
        const { data, error } = await supabase.from('picket_schedules').select('*');
        if (error) console.error('Error fetching picket schedules:', error);
        else if (data) console.log('Fetched picket schedules:', data);
    }

    // --- 5. Administrasi (Inventaris, Absensi, Jurnal) ---
    const inventarisContainer = document.getElementById('inventaris-container');
    if (inventarisContainer) {
        const { data, error } = await supabase.from('inventories').select('*');
        if (error) console.error('Error:', error);
        else console.log('Inventories:', data);
    }

    const absensiContainer = document.getElementById('absensi-container');
    if (absensiContainer) {
        const { data, error } = await supabase.from('attendances').select('*');
        if (error) console.error('Error:', error);
        else console.log('Attendances:', data);
    }

    const jurnalContainer = document.getElementById('jurnal-container');
    if (jurnalContainer) {
        const { data, error } = await supabase.from('journals').select('*');
        if (error) console.error('Error:', error);
        else console.log('Journals:', data);
    }

    // --- 6. Galeri ---
    const galeriContainer = document.getElementById('galeri-container');
    if (galeriContainer) {
        const { data, error } = await supabase.from('galleries').select('*');
        if (error) console.error('Error:', error);
        else console.log('Galleries:', data);
    }
});
`;
fs.writeFileSync(path.join(jsDir, 'supabase-fetch.js'), supabaseFetchContent);

// 2. Add IDs to containers in HTML files
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html'));
files.forEach(file => {
    let content = fs.readFileSync(path.join(dir, file), 'utf8');
    const $ = cheerio.load(content);
    
    if (file === 'profil_kelas-prestasi.html') {
        $('section .grid').first().attr('id', 'achievements-container');
    } else if (file === 'profil_kelas-anggota.html') {
        $('section#anggota .grid').first().attr('id', 'members-container');
    } else if (file === 'jadwal-mapel.html') {
        $('table').first().attr('id', 'jadwal-mapel-table');
    } else if (file === 'jadwal-piket.html') {
        $('main .grid').first().attr('id', 'jadwal-piket-container');
    } else if (file === 'administrasi-inventaris.html') {
        $('table').first().attr('id', 'inventaris-container');
    } else if (file === 'administrasi-absensi.html') {
        $('table').first().attr('id', 'absensi-container');
    } else if (file === 'administrasi-jurnali.html') {
        $('table').first().attr('id', 'jurnal-container');
    } else if (file === 'galeri.html') {
        $('main .grid').first().attr('id', 'galeri-container');
    }

    // Add the fetch script to all pages
    if (!$('script[src="./js/supabase-fetch.js"]').length) {
        $('body').append('<script src="./js/supabase-fetch.js"></script>');
    }

    fs.writeFileSync(path.join(dir, file), $.html());
    console.log("Updated " + file);
});
