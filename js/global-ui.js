/**
 * Aventrix RPL - Global UI & Smooth Page Transition Engine
 */
(function () {
    // 1. Inject smooth CSS transition styles into head
    const styleEl = document.createElement('style');
    styleEl.textContent = `
        body {
            opacity: 0;
            transition: opacity 0.15s ease-out !important;
        }
        body.page-loaded {
            opacity: 1 !important;
        }
    `;
    document.head.appendChild(styleEl);

    // 2. Trigger Instant Smooth Fade-In on Page Load
    function revealPage() {
        requestAnimationFrame(() => {
            document.body.classList.add('page-loaded');
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', revealPage);
    } else {
        revealPage();
    }

    // Handle back-forward cache (BFCache)
    window.addEventListener('pageshow', (event) => {
        if (event.persisted) {
            document.body.classList.add('page-loaded');
        }
    });

    // 4. Navbar Scroll Effect & Active Page Link Highlight
    document.addEventListener('DOMContentLoaded', () => {
        const nav = document.querySelector('nav');
        if (nav) {
            window.addEventListener('scroll', () => {
                if (window.scrollY > 30) {
                    nav.classList.add('shadow-md');
                } else {
                    nav.classList.remove('shadow-md');
                }
            }, { passive: true });
        }

        // Active link & underline highlighting based on page group
        const path = window.location.pathname.toLowerCase();
        const page = path.split('/').pop() || 'index.html';

        const navElements = document.querySelectorAll('.nav-link, .nav-dropdown-btn');
        if (navElements.length > 0) {
            navElements.forEach(el => {
                el.classList.remove('text-primary', 'border-b-2', 'border-primary', 'pb-1');
                el.classList.add('text-on-surface-variant');
            });

            const setActive = (el) => {
                if (!el) return;
                el.classList.add('text-primary', 'border-b-2', 'border-primary', 'pb-1');
                el.classList.remove('text-on-surface-variant');
            };

            if (page.includes('anggota') || page.includes('prestasi') || page.includes('profil')) {
                setActive(document.querySelector('[data-group="profil"]'));
            } else if (page.includes('jadwal')) {
                setActive(document.querySelector('[data-group="jadwal"]'));
            } else if (page.includes('inventaris') || page.includes('absensi') || page.includes('administrasi')) {
                setActive(document.querySelector('[data-group="administrasi"]'));
            } else if (page.includes('galeri')) {
                setActive(document.querySelector('[data-page="galeri"]'));
            } else {
                setActive(document.querySelector('[data-page="beranda"]'));
            }
        }
    });
})();
