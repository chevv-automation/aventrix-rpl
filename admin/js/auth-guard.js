// Middleware Check: Di setiap halaman admin (/admin/*.html), tambahkan skrip guard untuk memeriksa status login.
// Pastikan script ini dimuat SETELAH supabase-config.js.

(async function authGuard() {
    // Skip guard for login page
    const path = window.location.pathname;
    if (path.endsWith('login.html')) return;

    if (!window.supabaseClient) {
        console.error("Supabase client not initialized. Cannot perform auth guard.");
        return;
    }

    try {
        const { data: { session }, error } = await window.supabaseClient.auth.getSession();
        
        if (error || !session) {
            console.warn("Session tidak valid atau tidak ditemukan. Redirecting to login...");
            window.location.href = '/admin/login.html';
        }
    } catch (err) {
        console.error("Auth guard error:", err);
        window.location.href = '/admin/login.html';
    }
})();

// Fungsi logout global untuk admin
window.logoutAdmin = async function() {
    if (!window.supabaseClient) return;
    try {
        await window.supabaseClient.auth.signOut();
        window.location.href = '/admin/login.html';
    } catch (err) {
        console.error("Logout error:", err);
    }
};
