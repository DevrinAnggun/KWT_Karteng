import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/order_status_screen.dart';

void main() {
  runApp(KWTApp());
}

class KWTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KWT Karangtengah',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF5FFF4),
        fontFamily: 'Arial',
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
  HomeScreen(),
  ProductScreen(),
  OrderStatusScreen(), // dipindahkan sebelum ProfileScreen
  ProfileScreen(),     // sekarang paling kanan
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor: Colors.green[700],
  unselectedItemColor: Colors.grey[600],
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
    BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
    BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Status'), // dipindah ke sini
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),  // tetap paling kanan
  ],
),

    );
  }
}
