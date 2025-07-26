enum OrderStatus {
  diterima,
  diproses,
  siapAmbil,
}

class Order {
  final String productName;
  final int quantity;
  final DateTime date;
  final OrderStatus status;

  Order({
    required this.productName,
    required this.quantity,
    required this.date,
    required this.status,
  });
}