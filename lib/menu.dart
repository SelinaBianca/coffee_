import 'package:coffee_and_company/Cart.dart';
import 'package:coffee_and_company/home.dart';
import 'package:coffee_and_company/profile.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee & Co.- Menu'),
        ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Items',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Sample Card
            Expanded(
              child: ListView(
                children: [
                  _buildMenuCard('Creamy Latte', '\$5.00', 'assets/latte.jpg', 'Coffee'),
                  _buildMenuCard('Espresso', '\$6.00', 'assets/espresso.jpg', 'Coffee'),
                  _buildMenuCard('Iced Latte', '\$5.00', 'assets/coffee_main.png', 'Coffee'),
                  _buildMenuCard('Affogato', '\$5.00', 'assets/affogata.jpg', 'Coffee'),
                  _buildMenuCard('Macchiato', '\$5.00', 'assets/macchiato.jpg', 'Coffee'),
                  _buildMenuCard('Mocha', '\$5.00', 'assets/mocha.jpg', 'Coffee'),
                  _buildMenuCard('Irish Coffee', '\$5.00', 'assets/irish.jpg', 'Coffee'),
                  _buildMenuCard('Sea Food Pasta', '\$18.99', 'assets/pasta_image.jpg', 'Pasta'),
                  _buildMenuCard(' Pasta Cabonara', '\$20.99', 'assets/pasta_cabonara.jpg', 'Pasta'),
                  _buildMenuCard(' Pasta Bolognese', '\$17.99', 'assets/pasta_bolognese.jpg', 'Pasta'),
                  _buildMenuCard(' Pasta Arrabiata', '\$20.99', 'assets/pasta_arrabiata.jpeg', 'Pasta'),
                  _buildMenuCard(' Pasta Alfredo', '\$18.99', 'assets/fettuccine-alfredo.jpg', 'Pasta'),
                  _buildMenuCard('Gnocchi', '\$18.99', 'assets/gnocchi.jpg', 'Pasta'),
                  _buildMenuCard('Cheese & Mushroom Pizza', '\$11.00', 'assets/pizza_image3.jpeg', 'Pizza'),
                  _buildMenuCard('Prawn Pizza', '\$15.00', 'assets/pizza_image2.jpeg', 'Pizza'),
                  _buildMenuCard('Pepperoni Pizza', '\$10.99', 'assets/pizza_image.jpg', 'Pizza'),
                  _buildMenuCard('Spicy Chicken Pizza', '\$11.99', 'assets/spicy-chicken-pizza.jpg', 'Pizza'),
                  _buildMenuCard('Baked Tuna Pizza', '\$10.99', 'assets/pizza_tuna.jpg', 'Pizza'),
                  _buildMenuCard('Hot Butter Prawns Pizza', '\$11.99', 'assets/prawn_pizza.jpg', 'Pizza'),
                  _buildMenuCard('Fried Mushroom Pizza', '\$11.99', 'assets/pizza_image3.jpeg', 'Pizza'),
                  _buildMenuCard('Garlic Prawn Pizza', '\$11.99', 'assets/pizza_image2.jpeg', 'Pizza'),
                  _buildMenuCard('Bacon & Cheese Pizza', '\$11.99', 'assets/bacon_pizza.jpg', 'Pizza'),
                  _buildMenuCard('Nutella Pizza', '\$11.99', 'assets/nutella_pizza.jpg', 'Pizza'),
                  _buildMenuCard('Cheese Cake', '\$6.00', 'assets/cake_image.jpeg', 'Cake'),
                  _buildMenuCard('Brownies ', '\$7.00', 'assets/brownies.jpg', 'Cake'),
                  _buildMenuCard('Marble Cake', '\$6.00', 'assets/marble_cake.jpeg', 'Cake'),
                  _buildMenuCard('Red Velvet Cake', '\$8.00', 'assets/red_velvet.jpeg', 'Cake'),
                  _buildMenuCard('Tiramusu Cake', '\$6.00', 'assets/tiramusu.jpg', 'Cake'),
                  _buildMenuCard('Carrot Cake', '\$9.00', 'assets/carrot_cake.jpeg', 'Cake'),
                ],
              ),
            ),
          ],
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

                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);
                },
              ),
              IconButton(
                icon: Icon(Icons.restaurant_menu, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()),);
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(String itemName, String price, String imagePath, String category) {
    return Card(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {

                        },
                      ),
                      Text('1'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // Handle adding to cart
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
