// Global UI Script
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
