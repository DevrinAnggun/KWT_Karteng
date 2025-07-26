import 'package:flutter/material.dart';
import '../models/product.dart';
import 'order_form_screen.dart';

class ProductScreen extends StatelessWidget {
  
  final List<Product> vegetables = [
    Product(name: 'Bayam', price: 'Rp 3.000 / ikat'),
    Product(name: 'Kangkung', price: 'Rp 2.500 / ikat'),
    Product(name: 'Cabai Merah', price: 'Rp 10.000 / 250gr'),
    Product(name: 'Tomat', price: 'Rp 4.000 / 500gr'),
    Product(name: 'Terong Ungu', price: 'Rp 6.000 / kg'),
  ];

  final List<Product> healthyFoods = [
    Product(name: 'Keripik Bayam', price: 'Rp 7.000 / bungkus'),
    Product(name: 'Getuk Goreng', price: 'Rp 10.000 / pack'),
    Product(name: 'Peyek Kacang', price: 'Rp 8.000 / bungkus'),
    Product(name: 'Sambal Tempe', price: 'Rp 5.000 / cup'),
  ];

  final List<Product> healthyDrinks = [
    Product(name: 'Sirup Jahe Merah', price: 'Rp 15.000 / botol'),
    Product(name: 'Wedang Uwuh Instan', price: 'Rp 12.000 / pack'),
    Product(name: 'Jamu Kunyit Asam', price: 'Rp 10.000 / botol'),
  ];

  // Widget builder untuk setiap kategori
  Widget buildCategory(String title, List<Product> items, IconData icon, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: 8),
        ...items.map((product) => Card(
              color: Colors.green[50],
              child: ListTile(
                leading: Icon(icon, color: Colors.green),
                title: Text(product.name),
                subtitle: Text(product.price),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderFormScreen(productName: product.name),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                  ),
                  child: Text('Pesan'),
                ),
              ),
            )),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produk Kami'), backgroundColor: Colors.green),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              buildCategory('Sayuran & Tanaman', vegetables, Icons.local_florist, context),
              buildCategory('Makanan Sehat', healthyFoods, Icons.fastfood, context),
              buildCategory('Minuman Sehat', healthyDrinks, Icons.local_drink, context),
            ],
          ),
        ),
      ),
    );
  }
}
