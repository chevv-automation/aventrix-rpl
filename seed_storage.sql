-- 1. Membuat Bucket 'posters' untuk menyimpan gambar poster (bersifat Publik)
INSERT INTO storage.buckets (id, name, public) 
VALUES ('posters', 'posters', true)
ON CONFLICT (id) DO NOTHING;

-- 2. Menghapus kebijakan lama jika ada (mencegah error 'policy already exists')
DROP POLICY IF EXISTS "Public Access" ON storage.objects;
DROP POLICY IF EXISTS "Public Upload" ON storage.objects;

-- 3. Membuat kebijakan agar semua orang bisa melihat gambar di bucket 'posters'
CREATE POLICY "Public Access" 
ON storage.objects FOR SELECT 
USING ( bucket_id = 'posters' );

-- 4. Membuat kebijakan agar kita bisa mengunggah (upload) gambar ke bucket 'posters'
CREATE POLICY "Public Upload" 
ON storage.objects FOR INSERT 
WITH CHECK ( bucket_id = 'posters' );
