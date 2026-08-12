-- ============================================================
-- SKRIP PERBAIKAN RLS (ROW LEVEL SECURITY) SUPABASE
-- Aventrix RPL - Multi-Device Cloud Synchronization
-- ============================================================

-- 1. Tabel absensi
ALTER TABLE IF EXISTS absensi ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for absensi" ON absensi;
DROP POLICY IF EXISTS "Authenticated Insert for absensi" ON absensi;
DROP POLICY IF EXISTS "Authenticated Update for absensi" ON absensi;
DROP POLICY IF EXISTS "Authenticated Delete for absensi" ON absensi;
DROP POLICY IF EXISTS "Public All Access for absensi" ON absensi;
DROP POLICY IF EXISTS "Public Insert for absensi" ON absensi;
DROP POLICY IF EXISTS "Public Update for absensi" ON absensi;
DROP POLICY IF EXISTS "Public Delete for absensi" ON absensi;

CREATE POLICY "Public Read Access for absensi" ON absensi FOR SELECT USING (true);
CREATE POLICY "Public Insert for absensi" ON absensi FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for absensi" ON absensi FOR UPDATE USING (true);
CREATE POLICY "Public Delete for absensi" ON absensi FOR DELETE USING (true);

-- 2. Tabel jurnal_kelas
ALTER TABLE IF EXISTS jurnal_kelas ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Authenticated Insert for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Authenticated Update for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Authenticated Delete for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Public All Access for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Public Insert for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Public Update for jurnal_kelas" ON jurnal_kelas;
DROP POLICY IF EXISTS "Public Delete for jurnal_kelas" ON jurnal_kelas;

CREATE POLICY "Public Read Access for jurnal_kelas" ON jurnal_kelas FOR SELECT USING (true);
CREATE POLICY "Public Insert for jurnal_kelas" ON jurnal_kelas FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for jurnal_kelas" ON jurnal_kelas FOR UPDATE USING (true);
CREATE POLICY "Public Delete for jurnal_kelas" ON jurnal_kelas FOR DELETE USING (true);

-- 3. Tabel jadwal_piket
ALTER TABLE IF EXISTS jadwal_piket ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Authenticated Insert for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Authenticated Update for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Authenticated Delete for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Public All Access for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Public Insert for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Public Update for jadwal_piket" ON jadwal_piket;
DROP POLICY IF EXISTS "Public Delete for jadwal_piket" ON jadwal_piket;

CREATE POLICY "Public Read Access for jadwal_piket" ON jadwal_piket FOR SELECT USING (true);
CREATE POLICY "Public Insert for jadwal_piket" ON jadwal_piket FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for jadwal_piket" ON jadwal_piket FOR UPDATE USING (true);
CREATE POLICY "Public Delete for jadwal_piket" ON jadwal_piket FOR DELETE USING (true);

-- 4. Tabel profiles
ALTER TABLE IF EXISTS profiles ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for profiles" ON profiles;
DROP POLICY IF EXISTS "Authenticated Insert for profiles" ON profiles;
DROP POLICY IF EXISTS "Authenticated Update for profiles" ON profiles;
DROP POLICY IF EXISTS "Authenticated Delete for profiles" ON profiles;
DROP POLICY IF EXISTS "Public Insert for profiles" ON profiles;
DROP POLICY IF EXISTS "Public Update for profiles" ON profiles;
DROP POLICY IF EXISTS "Public Delete for profiles" ON profiles;

CREATE POLICY "Public Read Access for profiles" ON profiles FOR SELECT USING (true);
CREATE POLICY "Public Insert for profiles" ON profiles FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for profiles" ON profiles FOR UPDATE USING (true);
CREATE POLICY "Public Delete for profiles" ON profiles FOR DELETE USING (true);

-- 5. Tabel prestasi
ALTER TABLE IF EXISTS prestasi ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for prestasi" ON prestasi;
DROP POLICY IF EXISTS "Authenticated Insert for prestasi" ON prestasi;
DROP POLICY IF EXISTS "Authenticated Update for prestasi" ON prestasi;
DROP POLICY IF EXISTS "Public Insert for prestasi" ON prestasi;
DROP POLICY IF EXISTS "Public Update for prestasi" ON prestasi;
DROP POLICY IF EXISTS "Public Delete for prestasi" ON prestasi;

CREATE POLICY "Public Read Access for prestasi" ON prestasi FOR SELECT USING (true);
CREATE POLICY "Public Insert for prestasi" ON prestasi FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for prestasi" ON prestasi FOR UPDATE USING (true);
CREATE POLICY "Public Delete for prestasi" ON prestasi FOR DELETE USING (true);

-- 6. Tabel inventaris_kelas
ALTER TABLE IF EXISTS inventaris_kelas ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for inventaris_kelas" ON inventaris_kelas;
DROP POLICY IF EXISTS "Authenticated Insert for inventaris_kelas" ON inventaris_kelas;
DROP POLICY IF EXISTS "Public Insert for inventaris_kelas" ON inventaris_kelas;
DROP POLICY IF EXISTS "Public Update for inventaris_kelas" ON inventaris_kelas;
DROP POLICY IF EXISTS "Public Delete for inventaris_kelas" ON inventaris_kelas;

CREATE POLICY "Public Read Access for inventaris_kelas" ON inventaris_kelas FOR SELECT USING (true);
CREATE POLICY "Public Insert for inventaris_kelas" ON inventaris_kelas FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for inventaris_kelas" ON inventaris_kelas FOR UPDATE USING (true);
CREATE POLICY "Public Delete for inventaris_kelas" ON inventaris_kelas FOR DELETE USING (true);

-- 7. Tabel jadwal_pelajaran
ALTER TABLE IF EXISTS jadwal_pelajaran ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for jadwal_pelajaran" ON jadwal_pelajaran;
DROP POLICY IF EXISTS "Public Insert for jadwal_pelajaran" ON jadwal_pelajaran;
DROP POLICY IF EXISTS "Public Update for jadwal_pelajaran" ON jadwal_pelajaran;
DROP POLICY IF EXISTS "Public Delete for jadwal_pelajaran" ON jadwal_pelajaran;

CREATE POLICY "Public Read Access for jadwal_pelajaran" ON jadwal_pelajaran FOR SELECT USING (true);
CREATE POLICY "Public Insert for jadwal_pelajaran" ON jadwal_pelajaran FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for jadwal_pelajaran" ON jadwal_pelajaran FOR UPDATE USING (true);
CREATE POLICY "Public Delete for jadwal_pelajaran" ON jadwal_pelajaran FOR DELETE USING (true);

-- 8. Tabel tugas
CREATE TABLE IF NOT EXISTS tugas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mapel VARCHAR(255) NOT NULL,
    judul VARCHAR(255) NOT NULL,
    guru VARCHAR(255),
    deadline DATE,
    deskripsi TEXT,
    link TEXT,
    status VARCHAR(50) DEFAULT 'aktif',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE IF EXISTS tugas ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for tugas" ON tugas;
DROP POLICY IF EXISTS "Public Insert for tugas" ON tugas;
DROP POLICY IF EXISTS "Public Update for tugas" ON tugas;
DROP POLICY IF EXISTS "Public Delete for tugas" ON tugas;

CREATE POLICY "Public Read Access for tugas" ON tugas FOR SELECT USING (true);
CREATE POLICY "Public Insert for tugas" ON tugas FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for tugas" ON tugas FOR UPDATE USING (true);
CREATE POLICY "Public Delete for tugas" ON tugas FOR DELETE USING (true);

-- 9. Tabel galeri
CREATE TABLE IF NOT EXISTS galeri (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    judul VARCHAR(255) NOT NULL,
    kategori VARCHAR(100),
    tanggal VARCHAR(100),
    url TEXT NOT NULL,
    deskripsi TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE IF EXISTS galeri ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public Read Access for galeri" ON galeri;
DROP POLICY IF EXISTS "Public Insert for galeri" ON galeri;
DROP POLICY IF EXISTS "Public Update for galeri" ON galeri;
DROP POLICY IF EXISTS "Public Delete for galeri" ON galeri;

CREATE POLICY "Public Read Access for galeri" ON galeri FOR SELECT USING (true);
CREATE POLICY "Public Insert for galeri" ON galeri FOR INSERT WITH CHECK (true);
CREATE POLICY "Public Update for galeri" ON galeri FOR UPDATE USING (true);
CREATE POLICY "Public Delete for galeri" ON galeri FOR DELETE USING (true);
