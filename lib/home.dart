import 'package:coffee_and_company/Cart.dart';
import 'package:coffee_and_company/cake.dart';
import 'package:coffee_and_company/coffee.dart';
import 'package:coffee_and_company/menu.dart';
import 'package:coffee_and_company/pasta.dart';
import 'package:coffee_and_company/pizza.dart';
import 'package:coffee_and_company/profile.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee & Co.',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee & Co.'),

      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, Selina Fernando',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Image.asset(
                'assets/coffee_main.png',
                height: 250,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(context, 'assets/coffee_icon.jpg', 'Coffee', CoffeePage()),
                  _buildIconButton(context,'assets/pasta_icon.jpg', 'Pasta', PastaPage()),
                  _buildIconButton(context,'assets/pizza_icon.jpg', 'Pizza', PizzaPage()),
                  _buildIconButton(context,'assets/cake_icon.jpg', 'Cake' , CakePage()),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Popular Items',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              _buildPopularItems(),

              SizedBox(height: 20.0),
              Text(
                'Coffee & Co. Loyalty Points',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),

              Image.asset(
                'assets/coffee_poster.png',
                height: 600,
                width: 400,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 20.0),
              Text(
                'Personal Favourites',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.0),
              _buildFavouriteItems(),
            ],


          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
       height:50,
        child:BottomAppBar(
        color:  Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Navigate to home
                Navigator.push(context,MaterialPageRoute(builder:(context) => HomePage()),
                );
              },
            ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {

          Navigator.push(context,MaterialPageRoute(builder:(context) => CartPage()),
          );
        },
      ),
            IconButton(
              icon: Icon(Icons.restaurant_menu, color: Colors.white),
              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder:(context) => MenuPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder:(context) => ProfilePage()),
                );
              },
            ),

          ],
        ),
      ),
    ),
    );
  }
  Widget _buildIconButton(BuildContext context,String iconPath, String label, Widget pageToNavigate) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageToNavigate),
            );

          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(iconPath),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(label),
      ],
    );
  }

  Widget _buildPopularItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildItemCard('Creamy Latte', '\$5.00', 'assets/latte.jpg'),
          _buildItemCard('Sea Food Pasta', '\$18.99', 'assets/pasta_image.jpg'),
          _buildItemCard('Peperoni Pizza', '\$10.99', 'assets/pizza_image.jpg'),
          _buildItemCard('Cheese Cake', '\$6.00', 'assets/cake_image.jpeg'),

        ],
      ),
    );
  }
  Widget _buildFavouriteItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildItemCard('Machiatto', '\$5.00', 'assets/macchiato.jpg'),
          _buildItemCard('Affogato', '\$5.00', 'assets/affogata.jpg'),
          _buildItemCard('Peperoni Pizza', '\$10.99', 'assets/pizza_image.jpg'),
          _buildItemCard('Brownies', '\$7.00', 'assets/brownies.jpg'),

        ],
      ),
    );
  }
  Widget _buildItemCard(String name, String price, String imagePath) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                imagePath,
                height: 200,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {



                        },
                      ),
                      Text(
                        '- 1 +',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
