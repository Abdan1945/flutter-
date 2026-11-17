import 'package:flutter/material.dart';
import 'package:flutter_abdan_rpl3/pages/latihan_output_page.dart';
import 'package:intl/intl.dart';

class FormPpdb extends StatefulWidget {
  const FormPpdb({super.key});

  @override
  State<FormPpdb> createState() => _FormPpdbState();
}

class _FormPpdbState extends State<FormPpdb> {
  final _formKey = GlobalKey<FormState>();
  final _namaC = TextEditingController();
  final _nisnC = TextEditingController();
  final _emailC = TextEditingController();
  final _agamaC = TextEditingController();
  final _alamatC = TextEditingController();
  final _asalSekolahC = TextEditingController();
  final _tempatLahirC = TextEditingController();
  final _tanggalDaftarC = TextEditingController();
  final _tanggalLahirC = TextEditingController();

  String _jenisKelamin = 'Laki-laki';
  String _jurusan = '';
  bool _setuju = false;

  @override
  void dispose() {
    _namaC.dispose();
    _nisnC.dispose();
    _emailC.dispose();
    _agamaC.dispose();
    _alamatC.dispose();
    _asalSekolahC.dispose();
    _tempatLahirC.dispose();
    _tanggalDaftarC.dispose();
    _tanggalLahirC.dispose();
    super.dispose();
  }

  void _kirimPendaftaran() {
    if (_formKey.currentState!.validate()) {
      if (!_setuju) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kamu harus menyetujui tata tertib pendaftaran'),
          ),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HasilPage(
            nama: _namaC.text,
            nisn: _nisnC.text,
            email: _emailC.text,
            agama: _agamaC.text,
            gender: _jenisKelamin,
            tglDaftar: _tanggalDaftarC.text,
            alamat: _alamatC.text,
            asalSekolah: _asalSekolahC.text,
            jurusan: _jurusan,
            tempatLahir: _tempatLahirC.text,
            tanggalLahir: _tanggalLahirC.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pendaftaran PPDB')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaC,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  if (value.length < 3) {
                    return 'Nama minimal 3 huruf';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!value.contains('@')) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nisnC,
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: const InputDecoration(
                  labelText: 'NISN',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NISN tidak boleh kosong';
                  }
                  if (value.length != 16) {
                    return 'NISN harus terdiri dari 16 angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _agamaC.text.isEmpty
                    ? null
                    : _agamaC.text,
                decoration: const InputDecoration(
                  labelText: 'Agama',
                  border: OutlineInputBorder(),
                ),
                items: ['Islam', 'Kristen Protestan','Kristen Katolik', 'Hindu', 'Budha', 'Khonghucu']
                    .map(
                      (agama) => DropdownMenuItem(
                        value: agama,
                        child: Text(agama),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      _agamaC.text = value;
                    }
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih salah satu agama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tempatLahirC,
                decoration: const InputDecoration(
                  labelText: 'Tempat Lahir',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tempat lahir tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tanggalLahirC,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih tanggal lahir';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  final tanggalDipilih = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (tanggalDipilih != null) {
                    setState(() {
                      _tanggalLahirC.text = DateFormat('yyyy-MM-dd')
                          .format(tanggalDipilih);
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _asalSekolahC,
                decoration: const InputDecoration(
                  labelText: 'Asal Sekolah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Asal sekolah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _jurusan.isEmpty ? null : _jurusan,
                decoration: const InputDecoration(
                  labelText: 'Jurusan yang Dipilih',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'RPL', child: Text('RPL')),
                  DropdownMenuItem(value: 'TKJ', child: Text('TKJ')),
                  DropdownMenuItem(value: 'TSM', child: Text('TSM')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _jurusan = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih jurusan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alamatC,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Alamat Lengkap',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _tanggalDaftarC,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Daftar',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih tanggal pendaftaran';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  final tanggalDipilih = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (tanggalDipilih != null) {
                    setState(() {
                      _tanggalDaftarC.text = DateFormat('yyyy-MM-dd')
                          .format(tanggalDipilih);
                    });
                  }
                },
              ),
              const SizedBox(height: 8),
              RadioListTile<String>(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _jenisKelamin = value;
                    });
                  }
                },
              ),
              RadioListTile<String>(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: _jenisKelamin,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _jenisKelamin = value;
                    });
                  }
                },
              ),
              SwitchListTile(
                title: const Text('Saya menyetujui tata tertib pendaftaran'),
                value: _setuju,
                onChanged: (value) {
                  setState(() {
                    _setuju = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _kirimPendaftaran,
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
