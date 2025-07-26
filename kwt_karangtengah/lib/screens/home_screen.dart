import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul
              Text(
                'Selamat Datang di KWT Karangtengah!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),

              SizedBox(height: 10),

              // Gambar kwt.png
              Center(
                child: Image.asset(
                  'assets/images/kwt.png',
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      'Gambar gagal dimuat',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // Deskripsi
              Text(
                'Kami adalah kelompok wanita tani yang bergerak di bidang pertanian sayuran segar dan produk lokal.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
