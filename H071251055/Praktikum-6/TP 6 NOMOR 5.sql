CREATE DATABASE Perpustakaan

CREATE TABLE anggota (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR (50) NOT NULL,
	kota_domisili VARCHAR (20) NOT NULL
);

CREATE TABLE buku (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NULL,
	stok INT DEFAULT 1
);

CREATE TABLE peminjaman (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_anggota INT,
	constraint fk_anggota_pinjaman
	FOREIGN KEY (id_anggota)
	REFERENCES anggota(id),
	id_buku INT,
	constraint fk_buku_dipinjam
	FOREIGN KEY (id_buku)
	REFERENCES buku(id),
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INT DEFAULT 0
);


CREATE INDEX cari_berdasarkan_genre
ON buku(genre);

CREATE INDEX cari_berdasarkan_domisili
ON anggota(kota_domisili);


CREATE DATABASE Perpustakaan

CREATE TABLE anggota (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR (50) NOT NULL,
	kota_domisili VARCHAR (20) NOT NULL
);

CREATE TABLE buku (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	stok INT DEFAULT 1
);

CREATE TABLE peminjaman (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_anggota INT,
	constraint fk_anggota_pinjaman
	FOREIGN KEY (id_anggota)
	REFERENCES anggota(id),
	id_buku INT,
	constraint fk_buku_dipinjam
	FOREIGN KEY (id_buku)
	REFERENCES buku(id),
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INT DEFAULT 0
);


CREATE INDEX cari_berdasarkan_genre
ON buku(genre);

CREATE INDEX cari_berdasarkan_domisili
ON anggota(kota_domisili);


---SOAL TAMBAHAN
CREATE TABLE kurir (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_kurir VARCHAR(50) NOT NULL,
	no_telepon VARCHAR(50) NOT NULL UNIQUE,
	status_aktif BOOLEAN DEFAULT TRUE
)

CREATE TABLE pengiriman (
    id_pengiriman SERIAL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nomor_resi VARCHAR(30) NOT NULL UNIQUE,
    id_kurir INT,
    tanggal_kirim TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ongkos_kirim NUMERIC(12,2) NOT NULL CHECK (ongkos_kirim > 0),
    status_pengiriman VARCHAR(20) DEFAULT 'Dalam Perjalanan',
    CONSTRAINT FK_PENGIRIMAN_KURIR FOREIGN KEY (id_kurir) REFERENCES kurir(id)
);

CREATE INDEX idx_pengiriman_kurir
ON kurir(id);
CREATE INDEX idx_pengiriman_status
ON pengiriman(status_pengiriman);


DROP INDEX idx_pengiriman_status;
