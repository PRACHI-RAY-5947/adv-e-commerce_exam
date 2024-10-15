import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CartPage extends StatefulWidget {
  final Database database;

  CartPage({required this.database});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    final List<Map<String, dynamic>> items = await widget.database.query('Cart');
    setState(() {
      _cartItems = items;
    });
  }

  Future<void> _removeFromCart(int id) async {
    await widget.database.delete(
      'Cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          var item = _cartItems[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text("\$${item['price']}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeFromCart(item['id']);
              },
            ),
          );
        },
      ),
    );
  }
}
