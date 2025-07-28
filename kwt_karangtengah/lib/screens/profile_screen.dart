import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  void loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? 'Pengguna';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/ibuibu.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              userName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Kami adalah sekumpulan ibu-ibu desa yang aktif bertani dan memproduksi sayuran organik serta olahan pangan lokal.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
