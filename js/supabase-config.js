// Inisialisasi Supabase JS Client
const supabaseUrl = 'https://hcsrowlwbngnhyhrwvep.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhjc3Jvd2x3Ym5nbmh5aHJ3dmVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODYwMTI1MjcsImV4cCI6MjEwMTU4ODUyN30.cu75W_hVWvgrgpYI9MxF53P5KMte7MB8AbnArb_WI2Q';

window.supabaseClient = window.supabase ? window.supabase.createClient(supabaseUrl, supabaseKey) : null;

if (!window.supabaseClient) {
    console.error('Supabase client not loaded. Make sure the CDN script is included.');
} else {
    console.log('Supabase client initialized.');
}
