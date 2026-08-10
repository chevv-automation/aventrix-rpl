ALTER TYPE user_role_enum ADD VALUE IF NOT EXISTS 'Sekretaris';;;;SPLIT_HERE;;;ALTER TYPE user_role_enum ADD VALUE IF NOT EXISTS 'Bendahara';;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (1, 'Abraham Nathanael Leksono', 'Banyuwangi', '2008-11-07', '083122293905', 'abrahamnathanael0711@gmail.com', 'PERUM BERNADY LAND SLAWU, MAGNOLIA RAYA AA81-82', 'Anggota', 'Saya merupakan siswa kelas XII SMK jurusan Rekayasa Perangkat Lunak yang memiliki minat besar di bidang pengembangan perangkat lunak dan teknologi informasi. Saya memiliki kemampuan dasar dalam pembuatan website menggunakan HTML, CSS, PHP, serta pengelolaan database MySQL. Saya adalah pribadi yang disiplin, bertanggung jawab, mudah beradaptasi, dan memiliki semangat belajar yang tinggi. Saya mampu bekerja sama dalam tim maupun secara mandiri serta siap menerima masukan untuk terus meningkatkan kemampuan. Melalui kegiatan PKL, saya ingin memperoleh pengalaman kerja secara langsung, mengembangkan keterampilan teknis dan profesional, serta memberikan kontribusi terbaik bagi perusahaan.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (2, 'Adam Yusuf F. S', 'Mojokerto', '2009-05-26', '085784959709', 'adamfathir10@gmail.com', 'Jalan Kacapiring, Gebang, Jember', 'Anggota', 'Saya adalah siswa pindahan yang jujur bingung saat memilih sekolah dan jurusan di jember, bisa dibilang saya nyasar ke jurusan rpl dengan pengetahuan IT yang minim, tapi kalau bukan karena salah jurusan saya tidak akan pernah bertemu teman teman yang hebat di RPL')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (3, 'Adeluna Gayatri Rahmadyni ', 'Jember ', '2008-12-22', '082333880603', 'llunaade@gmail.com', 'tempurejo-pondokrejo', 'Anggota', 'saya siswa XII rpl yang aktif di bidang non akademik ')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (4, 'Anindya Widyadari Zizi ', 'Jember', '2008-12-25', '08155174555', 'anindyaziziwidyadari@gmail.com', 'Jl. Anggur VI No.65 Patrang Jember ', 'Anggota', 'Saya adalah pribadi yang memiliki rasa ingin tahu tinggi dan suka mengeksplorasi berbagai hal baru. Saya tertarik dengan teknologi, pemrograman, dan pengembangan website, tetapi juga senang mengembangkan kemampuan di luar bidang tersebut. Bagi saya, proses belajar tidak harus selalu sempurna, yang penting terus mencoba dan berkembang.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (5, 'Avniela Calista Novawan', 'Jember', '2009-07-03', '081336806535', 'avnielacalistanova@gmail.com', 'Tegal besar Permai 1 blok T.12', 'Bendahara', 'Saya seorang individu yang berorientasi pada hasil, memiliki standar kerja yang tinggi, dan adaptif terhadap tantangan baru')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (6, 'Chevy Abrary Aryasatya Darwono', 'Bojonegoro', '2009-07-24', '081216869755', 'chevyabrari@gmail.com', 'Jalan Branjangan, Bintoro, Jember', 'Anggota', 'Saya Chevv, siswa XII yang aktif mengeksplorasi dunia digital terutama pada pengembangan otomatisasi dan alur kerja bisnis')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (7, 'Christiano Flannery Sianto ', 'Nabire', '2008-06-08', '08773126243482132806', 'christianoflannery23@gmail.com', 'Perumahan Karangrejo asri blok d no 29', 'Anggota', 'Saya siswa SMK NEGERI 3 JEMBER JURUSAN RPL(REKAYASA PERANGKAT LUNAK)')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (8, 'Dayyana Khoirun Nisa''', 'Jember', '2008-08-02', '081252630652', 'kdayyana@gmail.com', 'Jl.  Anggur XV no.28 Perumnas Patrang', 'Wakil Ketua Kelas', 'Hai aku dayyana khoirun nisa, u guys can call me dayyana, aku cuma mau bilang, semakin kita besar semakin gada waktu buat tidur, bahkan tidur adalah hal yang paling kita tunggu-tunggu, jadi selagi kalian masih ada waktu untuk bisa tidur siang, tidurlah.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (9, 'Hikaru Aisha Fitria Santoso', 'Trenggalek', '2008-12-19', '082228157382', 'hikaruhiro9@gmail.com', 'Perumahan Asa Dreamlamd blok N-24, Bintoro, Jember', 'Anggota', 'Hikaru adalah Hikaru')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (10, 'Hizkia Ovel Caesaputra Kusuma ', 'BANYUWANGI ', '2008-04-09', '088901951669', 'hizkiaovel@gmail.com', 'JL DR Sumbandi Lingk Kreyongan Atas', 'Anggota', 'Saya adalah siswa XII RPL tinggi dalam pengembangan perangkat lunak, saya berharap kelebihan dan kekurangan saya bisa merubah menjadi yang lebih baik dan disiplin.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (11, 'Irland Rinesa', 'Surabaya', '2008-07-31', '082142962278', 'irlandrinesa7@gmail.com', 'Jl. dr soebandi gang VI No. 14', 'Anggota', 'Saya adalah Irland Rinesa siswa dari XII RPL dan saya asli dari surabaya, hobi saya emang membaca dan menulis dari dulu, saya pindah di Jember dari tahun 2021. semenjak saya pindah disini, saya selalu takut bertemu orang baru dan lama kelamaan saya sudah terbiasa dengan orang² sekitar sini, dan mengenai jurusan saya emang dari dulu pengen masuk yg namanya komputer dan knp saya milih rpl? karena sya ngira ini jurusan baru jdi sya masuk di jurusan itu, karena dlu yg sya ketahui hanya ad tkj... semenjak daftar sya lebih tertarik di rpl daripada tkj')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (12, 'Jonas Anointio Patra Lesmana', 'Jember', '2008-09-24', '082334731879', 'jonaspatra42@gmail.com', 'Jl.SentotPrawiroDirjo XI/9', 'Anggota', 'Saya adalah seorang siswa 12 rpl yang memiliki antusias tinggi dalam hal perkembangan teknologi. ')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (13, 'Jorel Permana', 'Jember', '2008-06-15', '085161021475', 'infomengaming@gmail.com', 'Girya gebang permai blok m kampung karang katak', 'Sekretaris', 'Saya adalah murid dari SMKN 3 JEMBER yang sedang di jurusan XII RPL yang saya cintai ini')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (14, 'Khanssa Alicia Fairy ', 'Jember', '2008-08-08', '085807478195', 'khanssa.fairy@gmail.com', 'jalan letjen suprapto 115', 'Anggota', 'HALLOOO AKU ALICIAA, kalian bisa panggil aku cia atau alic as cewe populer (eh bercanda ya✌🏻) aku orangnya ceriya!! (kalau lagi mood) jadi jangan sungkan untuk menyapa ya!!!')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (15, 'Khanza callista editia putri', 'Magetan', '2009-06-27', '081774124423', 'sa5500540@gmail.com', 'Asrama brigif raider 9 kostrad', 'Anggota', 'saya siswa kelas 12 RPL yang percaya diri, komunikatif, dan berani mengambil inisiatif. Saya selalu aktif di kelas, senang berdiskusi kelompok, dan siap belajar hal baru')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (16, 'MUHAMMAD CEZA FAIRUS', 'Jember', '2008-12-19', '0895414210991', 'mcezafairuz@gmail.com', 'Jl. Panjaitan Gang 12 Blok F no 37', 'Anggota', 'Saya seorang pelajar yang memiliki minat untuk mencoba hal baru seperti coding, jaringan komputer, mengoperasi videotron')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (17, 'Bima Mahesa', 'jember', '2008-04-30', '089531670221', 'mahesabima115@gmail.com', 'perum cempaka blok h15', 'Bendahara', 'hai, saya Mahesa Bima Satrio Riyanawa, seorang pelajar SMK Negeri 3 Jember jurusan Rekayasa Perangkat Lunak (RPL). Saya lahir di Jember pada 30 April 2008 dan saat ini berdomisili di Perum Cempaka, Jember.

Saya memiliki minat yang besar dalam bidang Frontend Development, khususnya dalam merancang dan mengembangkan antarmuka website yang modern, responsif, dan mudah digunakan. Saya telah mengerjakan beberapa proyek, seperti Sistem Jadwal Piket Masjid, Sistem Penerimaan Murid Baru (SPMB), serta beberapa proyek game dan website lainnya sebagai sarana mengembangkan kemampuan di bidang pemrograman.

Selain aktif dalam bidang teknologi, saya juga aktif berorganisasi sebagai Ketua Umum Majelis Perwakilan Kelas (MPK) SMK Negeri 3 Jember periode 2025–2026 dan anggota Divisi Hubungan Masyarakat (Humas) Himpunan Gebang Kedawung. Melalui pengalaman tersebut, saya mengembangkan kemampuan kepemimpinan, komunikasi, kerja sama tim, dan manajemen waktu.

Saya merupakan pribadi yang disiplin, bertanggung jawab, mudah beradaptasi, serta memiliki semangat belajar yang tinggi. Saya terus berupaya meningkatkan kemampuan teknis dan nonteknis agar dapat berkembang sebagai Frontend Developer yang profesional di masa depan.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (18, 'Mieke Juliyana Sari', 'Jember', '2008-07-01', '087837929553', 'mieke.juliyana34@smk.belajar.id', 'jl. silo karang baru sumberjati', 'Anggota', 'Saya adalah pribadi yang bertanggung jawab, disiplin, dan mudah belajar hal baru. Saya senang bekerja sama dalam tim maupun menyelesaikan tugas secara mandiri. Saya terbiasa mengerjakan tugas dengan teliti, mampu berkomunikasi dengan baik, serta selalu berusaha memberikan hasil yang terbaik. Saya juga memiliki semangat untuk terus mengembangkan kemampuan dan siap menghadapi tantangan di dunia kerja.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (19, 'Mikhaela Aulia Susanto ', 'JEMBER ', '2008-05-11', '087782384553', 'mikhaelasusanto@gmail.com', 'Jalan S. Parman gang X no.81', 'Sekretaris', 'Saya adalah siswi XII RPL saya sehari hari mengikuti pelajaran seperti biasanya.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (20, 'moch nabil alfiansyah', 'jember', '2008-11-10', '082143909630', 'muhammadnabill1011@gmail.com', 'jl. dr. soebandi no. 112', 'Anggota', 'Saya adalah seorang siswa kelas 12 rpl yang sedang antuisme mengembangkan web dan aplikasi serta menerapkan pembuatan desain')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (21, 'moh alvin ardiansyah ', 'jember', '2007-09-25', '085725578551', 'alvinjbr12@gmail.com', 'jl ahmad yani gang 8 nomer 88', 'Anggota', 'saya adalah kelas xll rpl semangat terus dalah kedepan nya')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (22, 'Nabiil Fawaaz Bassalama', 'Jember', '2008-09-29', '085233137970', 'gigaandra45@gmail.com', 'Jalan Lumba Lumba, Dharma alam, Jember', 'Anggota', 'Saya adalah Anak Rpl Dari kelas XII saya Bisa Membantu Sebisa saya Saya Agak Pemalu tapi saya Akan Melakukan sebisa Mungkin Untuk Membantu dan menyelesaikan Tugas')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (23, 'Nadyah gina fatin ', 'Jember', '2009-08-24', '085749371726', 'nadya.gina45@smk.belajar.id', 'Jalan raya Puger desa grenden', 'Anggota', 'Saya adalah siswa SMKN 3 JEMBER khusus nya jurusan Rekayasa Perangkat Lunak kelas vll,saya programmer pemula yang siap belajar bersama untuk mendapatkan yang terbaik nanti nya')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (24, 'Naufal Ahmad Zufar', 'jember', '2006-07-29', '082232999523', 'naufalzufar2907@gmail.com', 'Jalan Dokter Soebandi Gang 1 no 11', 'Anggota', 'saya adalah siswa XII rpl, bisa di panggil naufal/nopal, terserah kalian, nah, aku ini adalah salah satu dari siswa yang memang terlihat biasa saja dalam coding, tapi saya bisa melakukan "AI prompting" lebih lanjut dengan cara yang lebih optimal')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (25, 'Naya Nidya Kinanti Fajrin', 'Jember', '2008-09-24', '0858553006734', 'nayakinanti123@gmail.com', 'Telaga Kautsar Regency, Jalan Sarangan.  Blok H-05 SUMBERSARI JEMBER JAWA TIMUR', 'Anggota', 'Saya adalah seorang siswi kelas XII RPL biasa. Sehari hari saya belajar di sekolah dan lanjut berkegiatan seperti orang pada umumnya. Kepribadian saya juga seperti orang pada umumnya, tidak aneh aneh juga. Saya jarang berbuat hal hal nakal, jadi setiap hari saya hanya menjalani hidup seperti orang biasanya. Saya lumayan menyukai coding dan berharap di masa depan saya bisa terus belajar dan bekerja di bidang IT.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (26, 'Nikmatul Lovy Hafitriyah ', 'Jember', '2009-09-19', '081246120723', 'nikmatullovy4@gmail.com', 'Jln sritanjung lingkungan kaliwining wirolegi', 'Anggota', 'Saya adalah seseorang yang selalu ingin mencoba banyak hal, tetapi tidak memiliki kesempatan untuk melakukannya. Suka tidur, makan, dan juga bermain game.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (27, 'Queen Zhevanya Kirania Sekar Wijadi ', 'Jember', '2008-10-26', '087853020438', 'queenwijadi@gmail.com', 'Jl.Dr Soebandi atas, no 34 ', 'Anggota', 'saya adalah siswa RPL, yang selalu bisa diandalkan, saya juga lumayan menguasai bidang yang saya pilih')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (28, 'Rafi mahardika Kristanto', 'Jember', '2008-08-05', '08568146966', 'rafimahardika721@gmail.com', 'JL DR SOEBANDI 30', 'Anggota', 'Hi everyone, Rafi''s here.. Tidak banyak yang saya katakan di sini. Maybe now or not jika saya lebih memilih grow up or back to chillhod era.. Saya lebih memilih masa kecil saya yang penuh dengan canda tawa yang definisinya itu masih tidak memikirkan tentang dunia yang penuh rintangan ini, sungguh disaat itu saya ketawa tanpa ada rasa beban sama sekali. And now, in 17 years. Saya sungguh tidak merasakan apa itu namanya kebebasan, gimana??. Kuliah atau kerja.. Itu aja terus yang dipikirkan, menikmati masa muda mungkin sudah not enough. Ketawa sudah tidak selepas seperti dulu lagi.. Well, this is RL.. I really missed my chillhood memories..')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (29, 'rahadian kadhafi putra basuki', 'jember', '2008-07-06', '085655467406', 'dafi11026@gmail.com', 'Jalan Dr.soebandi GG 1 No 31', 'Anggota', 'Saya RPL saya bangga')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (30, 'Raihan Khairul Anam', 'Jember', '2008-11-03', '081232517611', 'raihanraihank568@gmail.com', 'Jl Merak No 22', 'Anggota', 'Perkenalkan nama saya Raihan Khairul Anam, seorang siswa yang berusaha menjadikan ilmu dan akhlak sebagai pedoman dalam kehidupan sehari-hari. Saya memiliki ketertarikan pada dunia teknologi, khususnya pengembangan web, serta aktif mengembangkan diri melalui berbagai kegiatan yang bermanfaat. Saya percaya bahwa belajar, berkarya, dan menjaga adab merupakan bagian dari ikhtiar untuk menjadi pribadi yang lebih baik dan memberi manfaat bagi sesama.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (31, 'Rakha Pratama Mahardika ', 'Jember', '2008-12-20', '085107025953', 'rakhathebest98@gmail.com', 'jalan langsep raya perumnas patrang 6k/3', 'Anggota', 'saya bernama rakha pratama mahardika,saya adalah anak rpl yang sangat menyukai musik,dan juga saya menyukai desain web,dan saya lumayan bisa menggunakan figma')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (32, 'Syawalia Safa Maharani ', 'Jember', '2008-10-01', '085648810379', 'syawaliasafamaharani@email.com', 'Perum Dharma Alam BD 28, Kaliwates, Jember', 'Anggota', 'Saya adalah siswi XII RPL, di waktu senggang saya lebih suka mendengarkan musik dan bernyanyi untuk menjernihkan pikiran.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (33, 'Wahyu Alsani Putra Alamsyah Bhaskara', 'Malang', '2010-01-31', '085155184589', 'wahyualsanipab@gmail.com', 'Perumahan New Rengganis Residence 2,Jambutan, Antirogo, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68125', 'Anggota', 'Saya adalah siswa XII RPL yang memiliki cita cita untuk bisa meraih kesuksesan atas usaha sendiri')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (34, 'Winda Aulia Rahma Putri', 'Jember Jawa Timur', '2008-12-13', '0895370379067', 'windaauliarp@gmail.com', 'Jalan Mawar No.68, Jemberlor, Patrang, Jember', 'Anggota', 'Halo aku winda dari kelas XII RPL, Aku seperti cermin, aku suka coklat, aku senang kalo ada coklat hehe😁')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;INSERT INTO profiles (nomor_absen, nama, tempat_lahir, tanggal_lahir, nomor_whatsapp, email, alamat_rumah, jabatan, deskripsi_diri)
VALUES (35, 'Yudika Adi Pratama ', 'Jember', '2008-06-05', '085119877437', 'diknya62@gmail.com', 'LINGK.GUMUK GADUNG', 'Ketua Kelas', 'Saya adalah siswa SMK negeri 3 Jember, hoby saya adalah berolahraga dan olahraga yang saya suka ialah pencak silat.')
ON CONFLICT (nomor_absen) DO UPDATE SET
    nama = EXCLUDED.nama,
    tempat_lahir = EXCLUDED.tempat_lahir,
    tanggal_lahir = EXCLUDED.tanggal_lahir,
    nomor_whatsapp = EXCLUDED.nomor_whatsapp,
    email = EXCLUDED.email,
    alamat_rumah = EXCLUDED.alamat_rumah,
    jabatan = EXCLUDED.jabatan,
    deskripsi_diri = EXCLUDED.deskripsi_diri;;;;SPLIT_HERE;;;

-- Table: tugas (Realtime Sync Across HP & Laptop)
CREATE TABLE IF NOT EXISTS public.tugas (
    id VARCHAR(100) PRIMARY KEY,
    mapel TEXT NOT NULL,
    judul TEXT NOT NULL,
    guru TEXT,
    deadline DATE,
    deskripsi TEXT,
    link TEXT,
    status VARCHAR(20) DEFAULT 'aktif',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS & Policies for tugas table
ALTER TABLE public.tugas ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow public read tugas" ON public.tugas;
DROP POLICY IF EXISTS "Allow public insert tugas" ON public.tugas;
DROP POLICY IF EXISTS "Allow public update tugas" ON public.tugas;
DROP POLICY IF EXISTS "Allow public delete tugas" ON public.tugas;

CREATE POLICY "Allow public read tugas" ON public.tugas FOR SELECT USING (true);
CREATE POLICY "Allow public insert tugas" ON public.tugas FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update tugas" ON public.tugas FOR UPDATE USING (true);
CREATE POLICY "Allow public delete tugas" ON public.tugas FOR DELETE USING (true);