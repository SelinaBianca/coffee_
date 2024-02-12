import 'package:flutter/material.dart';
import 'Home.dart';
import 'menu.dart';
import 'profile.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(name: 'Latte', price: 5.00),
    CartItem(name: 'Espresso', price: 3.00),
    CartItem(name: 'Cappuccino', price: 4.50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return _buildCartItem(cartItems[index]);
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.restaurant_menu, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            onPressed: () {

            },
            label: Text(
              'Pay  \$12.50',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Row(
          children: [
            Text('Price: \$${item.price.toStringAsFixed(2)}'),
            SizedBox(width: 20),
            Text('Quantity: '),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (item.quantity > 1) {
                    item.quantity--;
                  }
                });
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  item.quantity++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
