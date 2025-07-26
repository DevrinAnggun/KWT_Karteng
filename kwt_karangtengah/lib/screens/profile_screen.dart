import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = 'Siti Aminah';
  final String email = 'siti.aminah@example.com';
  final String address = 'Desa Karangtengah, Banjarnegara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/ibuibu.jpg'),
              ),
              SizedBox(height: 15),

              // Nama & Email
              Text(
                userName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style: TextStyle(color: Colors.grey[700]),
              ),

              SizedBox(height: 25),
              Divider(),

              // Informasi Profil
              ListTile(
                leading: Icon(Icons.person, color: Colors.green),
                title: Text('Nama'),
                subtitle: Text(userName),
              ),
              ListTile(
                leading: Icon(Icons.email, color: Colors.green),
                title: Text('Email'),
                subtitle: Text(email),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.green),
                title: Text('Alamat'),
                subtitle: Text(address),
              ),

              SizedBox(height: 20),

              // Tombol Aksi
              ElevatedButton.icon(
                onPressed: () {
                  // Tambahkan navigasi edit profil
                },
                icon: Icon(Icons.edit),
                label: Text('Edit Profil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {
                  // Tambahkan logika logout
                },
                icon: Icon(Icons.logout, color: Colors.red),
                label: Text('Logout', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
