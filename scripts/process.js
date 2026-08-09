const fs = require('fs');
const path = require('path');
const cheerio = require('cheerio');
require('dotenv').config();

const dir = __dirname;
const jsDir = path.join(dir, 'js');

// 1. Generate supabase-config.js
const supabaseUrl = process.env.SUPABASE_API_URL || '';
const supabaseAnon = process.env.SUPABASE_ANON_API || '';

const supabaseConfigContent = `// Inisialisasi Supabase JS Client
const supabaseUrl = '${supabaseUrl}';
const supabaseKey = '${supabaseAnon}';
const supabase = window.supabase ? window.supabase.createClient(supabaseUrl, supabaseKey) : null;

if (!supabase) {
    console.error('Supabase client not loaded. Make sure the CDN script is included.');
} else {
    console.log('Supabase client initialized.');
}
`;
fs.writeFileSync(path.join(jsDir, 'supabase-config.js'), supabaseConfigContent);

// 2. Generate global-ui.js
const globalUiContent = `// Global UI Script
document.addEventListener('DOMContentLoaded', () => {
    // Scroll reveal animation
    const observerOptions = { threshold: 0.1 };
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('opacity-100', 'translate-y-0');
                entry.target.classList.remove('opacity-0', 'translate-y-10');
            }
        });
    }, observerOptions);

    document.querySelectorAll('section, .card').forEach(el => {
        if (!el.classList.contains('no-reveal')) {
            el.classList.add('transition-all', 'duration-1000', 'opacity-0', 'translate-y-10');
            observer.observe(el);
        }
    });

    // Navbar Scroll Effect
    const nav = document.querySelector('nav');
    if (nav) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                nav.classList.add('h-16', 'shadow-md');
                nav.classList.remove('h-20', 'shadow-sm');
            } else {
                nav.classList.add('h-20', 'shadow-sm');
                nav.classList.remove('h-16', 'shadow-md');
            }
        });
    }
});
`;
fs.writeFileSync(path.join(jsDir, 'global-ui.js'), globalUiContent);

// 3. Process HTML files
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html'));

// Emoji removal regex
const emojiRegex = /([\u2700-\u27BF]|[\uE000-\uF8FF]|\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|[\u2011-\u26FF]|\uD83E[\uDD10-\uDDFF])/g;

files.forEach(file => {
    let content = fs.readFileSync(path.join(dir, file), 'utf8');
    
    const $ = cheerio.load(content);
    
    // Remove existing navs or headers that act as nav
    $('nav').remove();
    // Some files might have header as nav dock
    $('header.docked').remove();
    
    // Determine active menu
    let activeMenu = '';
    if (file === 'index.html') activeMenu = 'Beranda';
    else if (file.startsWith('profil_kelas') || file === 'detailed_anggota.html') activeMenu = 'Profil Kelas';
    else if (file.startsWith('jadwal')) activeMenu = 'Jadwal';
    else if (file.startsWith('administrasi')) activeMenu = 'Administrasi';
    else if (file === 'galeri.html') activeMenu = 'Galeri';

    // Generate Universal Navbar
    const getNavClass = (menuName) => {
        const base = "flex items-center gap-1 font-label-caps text-label-caps transition-all ";
        if (menuName === activeMenu) {
            return base + "text-primary border-b-2 border-primary pb-1";
        }
        return base + "text-on-surface-variant hover:text-primary";
    };

    const getLinkClass = (menuName) => {
        const base = "font-label-caps text-label-caps transition-colors ";
        if (menuName === activeMenu) {
            return base + "text-primary border-b-2 border-primary pb-1";
        }
        return base + "text-on-surface-variant hover:text-primary";
    };

    const universalNav = `
<nav class="fixed top-0 w-full z-50 bg-white/90 backdrop-blur-md border-b border-outline-variant/30 shadow-sm h-20 transition-all duration-300">
    <div class="flex justify-between items-center w-full px-gutter max-w-container-max mx-auto h-full">
        <a href="index.html" class="font-display-lg-mobile text-2xl font-extrabold text-primary tracking-tight">XII RPL</a>
        <div class="hidden md:flex items-center gap-8">
            <a href="index.html" class="${getLinkClass('Beranda')}">Beranda</a>
            
            <div class="relative group">
                <button class="${getNavClass('Profil Kelas')}">Profil Kelas <span class="material-symbols-outlined text-[16px] group-hover:rotate-180 transition-transform duration-300">expand_more</span></button>
                <div class="absolute top-full left-0 mt-2 w-56 bg-white rounded-lg shadow-xl border border-outline-variant/20 z-50 py-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-y-2 group-hover:translate-y-0">
                    <a href="profil_kelas-prestasi.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Daftar Prestasi</a>
                    <a href="profil_kelas-anggota.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Anggota Kelas</a>
                </div>
            </div>

            <div class="relative group">
                <button class="${getNavClass('Jadwal')}">Jadwal <span class="material-symbols-outlined text-[16px] group-hover:rotate-180 transition-transform duration-300">expand_more</span></button>
                <div class="absolute top-full left-0 mt-2 w-56 bg-white rounded-lg shadow-xl border border-outline-variant/20 z-50 py-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-y-2 group-hover:translate-y-0">
                    <a href="jadwal-mapel.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Jadwal Mata Pelajaran</a>
                    <a href="jadwal-piket.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Jadwal Piket</a>
                </div>
            </div>

            <div class="relative group">
                <button class="${getNavClass('Administrasi')}">Administrasi <span class="material-symbols-outlined text-[16px] group-hover:rotate-180 transition-transform duration-300">expand_more</span></button>
                <div class="absolute top-full left-0 mt-2 w-56 bg-white rounded-lg shadow-xl border border-outline-variant/20 z-50 py-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 translate-y-2 group-hover:translate-y-0">
                    <a href="administrasi-inventaris.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Inventaris Kelas</a>
                    <a href="administrasi-absensi.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Absensi Kelas</a>
                    <a href="administrasi-jurnali.html" class="block px-6 py-3 text-[14px] text-on-surface hover:bg-primary/5 hover:text-primary transition-colors">Jurnal Kelas</a>
                </div>
            </div>

            <a href="galeri.html" class="${getLinkClass('Galeri')}">Galeri</a>
        </div>
        
        <button class="bg-gradient-to-r from-primary to-[#7C3AED] text-white px-6 py-2.5 rounded-lg font-bold text-sm hover:opacity-90 transition-opacity shadow-md">Hubungi Kami</button>
    </div>
</nav>
`;
    
    $('body').prepend(universalNav);

    // Ensure body has padding-top so content doesn't hide behind fixed nav
    // Most files might need a padding top if they don't have one.
    // I'll add pt-20 to the main wrapper or just to body, but body classes might be overridden. 
    // Usually section or main or header handles it.

    // Remove old scripts that might conflict
    $('script[src*="supabase"]').remove();
    $('script[src*="supabase-config.js"]').remove();
    $('script[src*="global-ui.js"]').remove();

    // Inject Supabase CDN and global JS
    $('body').append(`
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
<script src="./js/supabase-config.js"></script>
<script src="./js/global-ui.js"></script>
    `);

    // Serialize HTML
    let outHtml = $.html();

    // Dash Replacement
    outHtml = outHtml.replace(/—|–/g, '-');
    
    // Emoji Removal
    outHtml = outHtml.replace(emojiRegex, '');

    fs.writeFileSync(path.join(dir, file), outHtml);
    console.log("Processed " + file);
});
