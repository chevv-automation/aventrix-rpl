CREATE TABLE IF NOT EXISTS jadwal_pelajaran (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    hari VARCHAR(20) NOT NULL,
    mata_pelajaran VARCHAR(100) NOT NULL,
    guru_pengajar VARCHAR(150) NOT NULL,
    dari_jp INT NOT NULL,
    sampai_jp INT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE jadwal_pelajaran ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist to prevent ERROR 42710
DROP POLICY IF EXISTS "Public Read Access for jadwal_pelajaran" ON jadwal_pelajaran;
DROP POLICY IF EXISTS "Authenticated Write for jadwal_pelajaran" ON jadwal_pelajaran;

-- Create policies safely
CREATE POLICY "Public Read Access for jadwal_pelajaran" ON jadwal_pelajaran FOR SELECT USING (true);
CREATE POLICY "Authenticated Write for jadwal_pelajaran" ON jadwal_pelajaran FOR ALL USING (auth.role() = 'authenticated');

TRUNCATE TABLE jadwal_pelajaran;

INSERT INTO jadwal_pelajaran (hari, mata_pelajaran, guru_pengajar, dari_jp, sampai_jp) VALUES
-- SENIN
('Senin', 'UPACARA', 'Pembina Upacara', 1, 1),
('Senin', 'MP RPL', 'Vika Octavia M, S.Pd', 2, 4),
('Senin', 'MP RPL', 'Vika Octavia M, S.Pd', 5, 6),
('Senin', 'PKK RPL', 'Vika Octavia M, S.Pd', 7, 7),
('Senin', 'PKK RPL', 'Vika Octavia M, S.Pd', 8, 9),
('Senin', 'KIK', 'Anang Ariful Habib, S.Pd', 10, 10),

-- SELASA
('Selasa', 'MTK', 'Fatimatur Rasyidah, S.Pd', 1, 3),
('Selasa', 'BK', 'Ahmad Anwar Evendy, S.Pd', 4, 4),
('Selasa', 'Pendidikan Pancasila', 'Lusi Dwi Lestari, S.Pd', 5, 6),
('Selasa', 'PABP', 'Hatifah Rozana M, S.Pd', 7, 7),
('Selasa', 'PABP', 'Hatifah Rozana M, S.Pd', 8, 9),

-- RABU
('Rabu', 'KK RPL', 'Dony Tatang T, S.Kom', 2, 4),
('Rabu', 'KK RPL', 'Dony Tatang T, S.Kom', 5, 7),
('Rabu', 'KK RPL', 'Dony Tatang T, S.Kom', 10, 12),

-- KAMIS
('Kamis', 'KK RPL', 'Mimin Putri Rahayuni, S.Kom', 2, 4),
('Kamis', 'KK RPL', 'Mimin Putri Rahayuni, S.Kom', 5, 7),
('Kamis', 'KK RPL', 'Mimin Putri Rahayuni, S.Kom', 8, 10),

-- JUMAT
('Jumat', 'JUBERS', 'Pendamping Kelas', 1, 2),
('Jumat', 'Bahasa Indonesia', 'Lian Tri Hapsari Mevianta, S.Pd', 3, 4),
('Jumat', 'Bahasa Inggris', 'Tinta Ratnawati, S.Pd', 5, 7);
