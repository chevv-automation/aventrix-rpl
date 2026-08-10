// Inisialisasi Supabase JS Client Global
const supabaseUrl = 'https://hcsrowlwbngnhyhrwvep.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhjc3Jvd2x3Ym5nbmh5aHJ3dmVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODYwMTI1MjcsImV4cCI6MjEwMTU4ODUyN30.cu75W_hVWvgrgpYI9MxF53P5KMte7MB8AbnArb_WI2Q';

window.SUPABASE_URL = supabaseUrl;
window.SUPABASE_ANON_KEY = supabaseKey;

window.getSupabase = function() {
    if (window.supabaseClient) return window.supabaseClient;
    if (window.supabase && typeof window.supabase.createClient === 'function') {
        window.supabaseClient = window.supabase.createClient(supabaseUrl, supabaseKey);
        return window.supabaseClient;
    }
    return null;
};

window.supabaseClient = window.getSupabase();

if (!window.supabaseClient) {
    console.warn('Supabase client not immediately initialized. Will initialize on demand.');
} else {
    console.log('Supabase client initialized successfully.');
}
