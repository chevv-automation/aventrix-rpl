// Middleware Check: Di setiap halaman admin (/admin/*.html), periksa status login.
// Redirect ke /admin/login.html jika belum terautentikasi.

(async function authGuard() {
    // Skip guard for login page
    const path = window.location.pathname.toLowerCase();
    if (path.endsWith('login.html') || path.endsWith('login.html/')) return;

    // 1. Check local session (sessionStorage or localStorage)
    const isSessionActive = sessionStorage.getItem('admin_session') === 'true' || 
                            localStorage.getItem('admin_session') === 'true';

    if (isSessionActive) {
        return; // Valid admin session
    }

    // 2. Check Supabase auth session if client available
    const client = typeof window.getSupabase === 'function' ? window.getSupabase() : (window.supabaseClient || null);
    if (client && client.auth) {
        try {
            const { data: { session }, error } = await client.auth.getSession();
            if (!error && session) {
                sessionStorage.setItem('admin_session', 'true');
                localStorage.setItem('admin_session', 'true');
                return; // Valid session
            }
        } catch (err) {
            console.warn("Auth guard session check note:", err);
        }
    }

    // Not authenticated -> redirect to login page immediately
    console.warn("Session tidak valid atau belum login. Redirecting to /admin/login.html...");
    
    const loginUrl = window.location.origin + '/admin/login.html';
    if (window.location.href !== loginUrl) {
        window.location.replace(loginUrl);
    }
})();

// Fungsi logout global untuk admin
window.logoutAdmin = async function() {
    sessionStorage.removeItem('admin_session');
    sessionStorage.removeItem('admin_email');
    localStorage.removeItem('admin_session');
    localStorage.removeItem('admin_email');

    const client = typeof window.getSupabase === 'function' ? window.getSupabase() : (window.supabaseClient || null);
    if (client && client.auth) {
        try {
            await client.auth.signOut();
        } catch (err) {
            console.error("Logout error:", err);
        }
    }
    
    const loginUrl = window.location.origin + '/admin/login.html';
    window.location.replace(loginUrl);
};
