import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'CartScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  late Database _database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'cart.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Cart(id INTEGER PRIMARY KEY, name TEXT, price TEXT)',
        );
      },
    );
  }

  Future<void> _addProductToCart(String name, String price) async {
    await _database.insert(
      'Cart',
      {'name': name, 'price': price},
    );
  }

  void _showAddProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _productNameController,
                decoration: InputDecoration(hintText: "Product Name"),
              ),
              TextField(
                controller: _productPriceController,
                decoration: InputDecoration(hintText: "Product Price"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addProductToFirestore();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addProductToFirestore() async {
    String name = _productNameController.text;
    String price = _productPriceController.text;

    if (name.isNotEmpty && price.isNotEmpty) {
      await FirebaseFirestore.instance.collection('products').add({
        'name': name,
        'price': price,
      });
      Navigator.of(context as BuildContext).pop();
      _productNameController.clear();
      _productPriceController.clear();
    }
  }

  Future<void> _deleteProduct(String productId) async {
    await FirebaseFirestore.instance.collection('products').doc(productId).delete();
  }

  Future<void> _addToCart(String name, String price) async {
    await _addProductToCart(name, price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(database: _database)),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var product = snapshot.data!.docs[index];
              String productId = product.id;
              String productName = product['name'];
              String productPrice = product['price'];

              return ListTile(
                title: Text(productName),
                subtitle: Text("\$${productPrice}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        _addToCart(productName, productPrice);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteProduct(productId);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddProductDialog(context);  // Pass context correctly here
        },
      ),
    );
  }
}
