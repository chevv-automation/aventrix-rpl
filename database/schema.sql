-- 1. ENUM Types Definition
CREATE TYPE user_role_enum AS ENUM ('Ketua Kelas', 'Wakil Ketua Kelas', 'Sekretaris 1', 'Sekretaris 2', 'Bendahara 1', 'Bendahara 2', 'Anggota');
CREATE TYPE level_enum AS ENUM ('Kabupaten', 'Provinsi', 'Nasional', 'Internasional');
CREATE TYPE participant_type_enum AS ENUM ('Tunggal', 'Kelompok');
CREATE TYPE condition_enum AS ENUM ('Baik', 'Perlu Perhatian', 'Rusak');
CREATE TYPE attendance_status_enum AS ENUM ('Hadir', 'Izin', 'Sakit', 'Alpa');
CREATE TYPE day_enum AS ENUM ('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat');

-- 2. Database Tables & Schema

-- Table 1: profiles
CREATE TABLE profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nomor_absen INT UNIQUE NOT NULL,
    nama VARCHAR(255) NOT NULL,
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    nomor_whatsapp VARCHAR(20),
    email VARCHAR(255) UNIQUE,
    alamat_rumah TEXT,
    jabatan user_role_enum DEFAULT 'Anggota',
    deskripsi_diri TEXT,
    hobi TEXT,
    kata_motivasi TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 2: prestasi
CREATE TABLE prestasi (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    judul VARCHAR(255) NOT NULL,
    tingkat level_enum NOT NULL,
    tanggal DATE NOT NULL,
    tipe_peserta participant_type_enum NOT NULL,
    peserta TEXT NOT NULL,
    guru_pembimbing VARCHAR(255),
    deskripsi_lomba TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 3: jadwal_pelajaran
CREATE TABLE jadwal_pelajaran (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mata_pelajaran VARCHAR(255) NOT NULL,
    guru_pengajar VARCHAR(255),
    hari day_enum NOT NULL,
    dari_jp INT NOT NULL,
    sampai_jp INT NOT NULL,
    total_jp INT GENERATED ALWAYS AS (sampai_jp - dari_jp + 1) STORED,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 4: inventaris_kelas
CREATE TABLE inventaris_kelas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nama VARCHAR(255) NOT NULL,
    kondisi condition_enum DEFAULT 'Baik' NOT NULL,
    lokasi VARCHAR(255) DEFAULT 'Ruang Kelas XII RPL' NOT NULL,
    jumlah INT DEFAULT 1 NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 5: absensi
CREATE TABLE absensi (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    nama VARCHAR(255) NOT NULL,
    tanggal DATE DEFAULT CURRENT_DATE NOT NULL,
    status attendance_status_enum DEFAULT 'Hadir' NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 6: jurnal_kelas
CREATE TABLE jurnal_kelas (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    judul VARCHAR(255) NOT NULL,
    mata_pelajaran VARCHAR(255) NOT NULL,
    guru_pengajar VARCHAR(255) NOT NULL,
    materi TEXT NOT NULL,
    deskripsi TEXT,
    tanggal DATE DEFAULT CURRENT_DATE NOT NULL,
    hari day_enum NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Row Level Security (RLS) & Policies

-- Enable RLS for all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE prestasi ENABLE ROW LEVEL SECURITY;
ALTER TABLE jadwal_pelajaran ENABLE ROW LEVEL SECURITY;
ALTER TABLE inventaris_kelas ENABLE ROW LEVEL SECURITY;
ALTER TABLE absensi ENABLE ROW LEVEL SECURITY;
ALTER TABLE jurnal_kelas ENABLE ROW LEVEL SECURITY;

-- Public Read Access Policies (Allow anonymous read)
CREATE POLICY "Public Read Access for profiles" ON profiles FOR SELECT USING (true);
CREATE POLICY "Public Read Access for prestasi" ON prestasi FOR SELECT USING (true);
CREATE POLICY "Public Read Access for jadwal_pelajaran" ON jadwal_pelajaran FOR SELECT USING (true);
CREATE POLICY "Public Read Access for inventaris_kelas" ON inventaris_kelas FOR SELECT USING (true);
CREATE POLICY "Public Read Access for absensi" ON absensi FOR SELECT USING (true);
CREATE POLICY "Public Read Access for jurnal_kelas" ON jurnal_kelas FOR SELECT USING (true);

-- Authenticated Full Access Policies (Allow authenticated users to insert/update/delete)
-- NOTE: We use "auth.role() = 'authenticated'" for checking authentication.
CREATE POLICY "Authenticated Insert for profiles" ON profiles FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for profiles" ON profiles FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for profiles" ON profiles FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated Insert for prestasi" ON prestasi FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for prestasi" ON prestasi FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for prestasi" ON prestasi FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated Insert for jadwal_pelajaran" ON jadwal_pelajaran FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for jadwal_pelajaran" ON jadwal_pelajaran FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for jadwal_pelajaran" ON jadwal_pelajaran FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated Insert for inventaris_kelas" ON inventaris_kelas FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for inventaris_kelas" ON inventaris_kelas FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for inventaris_kelas" ON inventaris_kelas FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated Insert for absensi" ON absensi FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for absensi" ON absensi FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for absensi" ON absensi FOR DELETE USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated Insert for jurnal_kelas" ON jurnal_kelas FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for jurnal_kelas" ON jurnal_kelas FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for jurnal_kelas" ON jurnal_kelas FOR DELETE USING (auth.role() = 'authenticated');

-- Table 7: admin_users (For metadata if using Supabase Auth, or Mock Auth)
CREATE TABLE admin_users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    nama_admin VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table 8: jadwal_piket
CREATE TABLE jadwal_piket (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    hari day_enum NOT NULL,
    urutan_piket INT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE jadwal_piket ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow admin read" ON admin_users FOR SELECT USING (true);

CREATE POLICY "Public Read Access for jadwal_piket" ON jadwal_piket FOR SELECT USING (true);
CREATE POLICY "Authenticated Insert for jadwal_piket" ON jadwal_piket FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Update for jadwal_piket" ON jadwal_piket FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated Delete for jadwal_piket" ON jadwal_piket FOR DELETE USING (auth.role() = 'authenticated');
