import 'package:flutter/material.dart';

class OrderFormScreen extends StatefulWidget {
  final String productName;

  const OrderFormScreen({Key? key, required this.productName}) : super(key: key);

  @override
  _OrderFormScreenState createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jumlahController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitOrder() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("✅ Pesanan untuk ${widget.productName} diterima!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Mohon lengkapi semua data!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pemesanan'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Pesan Produk: ${widget.productName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800])),
              SizedBox(height: 20),
              TextFormField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah Pesanan",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty ? "Wajib diisi" : null,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Tanggal belum dipilih'
                        : 'Tanggal: ${_selectedDate!.toLocal().toString().split(' ')[0]}'),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text("Pilih Tanggal"),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitOrder,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Kirim Pesanan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
