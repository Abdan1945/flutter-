import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final String 
  nama, 
  nisn, 
  email, 
  agama, 
  gender, 
  tglDaftar, 
  alamat,
  tempatLahir,
  tanggalLahir, 
  asalSekolah, 
  jurusan;

  const HasilPage({
    super.key,
    required this.nama,
    required this.nisn,
    required this.email,
    required this.agama,
    required this.gender, 
    required this.tglDaftar,
    required this.alamat,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.asalSekolah,
    required this.jurusan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Pendaftaran')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $nama'),
            Text('NISN: $nisn'),
            Text('Tempat lahir: $tempatLahir'),
            Text('Tanggal lahir: $tanggalLahir'),
            Text('Asal sekolah: $asalSekolah'),
            Text('Jurusan: $jurusan'),
            Text('Email: $email'),
            Text('Alamat: $alamat'),
            Text('Agama: $agama'),
            Text('Tanggal: $tglDaftar'),
            Text('Jenis kelamin: $gender'),
          ],
        ),
      ),
    );
  }
}