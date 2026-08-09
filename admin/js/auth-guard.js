// Middleware Check: Di setiap halaman admin (/admin/*.html), tambahkan skrip guard untuk memeriksa status login.
// Pastikan script ini dimuat SETELAH supabase-config.js.

(async function authGuard() {
    // Skip guard for login page
    const path = window.location.pathname;
    if (path.endsWith('login.html')) return;

    // 1. Check local session fallback first
    if (localStorage.getItem('admin_session') === 'true') {
        return; // Valid admin session
    }

    // 2. Check Supabase auth session if client available
    if (window.supabaseClient && window.supabaseClient.auth) {
        try {
            const { data: { session }, error } = await window.supabaseClient.auth.getSession();
            if (!error && session) {
                localStorage.setItem('admin_session', 'true');
                return;
            }
        } catch (err) {
            console.warn("Auth guard session check exception:", err);
        }
    }

    // Not authenticated -> redirect to login
    console.warn("Session tidak valid atau belum login. Redirecting to login...");
    window.location.href = 'login.html';
})();

// Fungsi logout global untuk admin
window.logoutAdmin = async function() {
    localStorage.removeItem('admin_session');
    localStorage.removeItem('admin_email');
    if (window.supabaseClient && window.supabaseClient.auth) {
        try {
            await window.supabaseClient.auth.signOut();
        } catch (err) {
            console.error("Logout error:", err);
        }
    }
    window.location.href = 'login.html';
};
