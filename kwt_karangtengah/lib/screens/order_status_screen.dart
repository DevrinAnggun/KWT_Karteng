import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwt_karangtengah/screens/order.dart';

class OrderStatusScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      productName: 'Bayam',
      quantity: 2,
      date: DateTime.now(),
      status: OrderStatus.diproses,
    ),
    Order(
      productName: 'Sirup Jahe Merah',
      quantity: 1,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: OrderStatus.diterima,
    ),
    Order(
      productName: 'Getuk Goreng',
      quantity: 3,
      date: DateTime.now(),
      status: OrderStatus.siapAmbil,
    ),
  ];

  String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.diterima:
        return 'Diterima';
      case OrderStatus.diproses:
        return 'Diproses';
      case OrderStatus.siapAmbil:
        return 'Siap Diambil';
    }
  }

  Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.diterima:
        return Colors.orange;
      case OrderStatus.diproses:
        return Colors.blue;
      case OrderStatus.siapAmbil:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status Pesanan'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(order.productName),
              subtitle: Text(
                'Jumlah: ${order.quantity} - Tanggal: ${DateFormat('dd MMM yyyy').format(order.date)}',
              ),
              trailing: Text(
                getStatusText(order.status),
                style: TextStyle(
                  color: getStatusColor(order.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
