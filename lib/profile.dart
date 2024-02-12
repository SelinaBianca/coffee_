import 'package:coffee_and_company/Cart.dart';
import 'package:coffee_and_company/login.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_company/menu.dart';
import 'package:coffee_and_company/home.dart';



import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkModeEnabled = false;
  ThemeData currentTheme = ThemeData.light(); // Set initial theme as light

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: currentTheme, // Set the current theme
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),

        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _buildPortraitLayout();
            } else {
              return _buildLandscapeLayout();
            }
          },
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              label: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_photo.png'), // Replace with actual photo
          ),
          SizedBox(height: 20.0),
          Text(
            'Selina Fernando',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Address:23/7 Barnes Place, Colombo - 03',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Card Details: 1234-1234-1234-1234',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Coffee & Co. Points: 200',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Switch(
                value: isDarkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    isDarkModeEnabled = value;
                    _toggleTheme(value);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_photo.png'),
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selina Fernando',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Points: 100',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Switch(
                    value: isDarkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        isDarkModeEnabled = value;
                        _toggleTheme(value);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      if (isDarkMode) {
        currentTheme = ThemeData.dark(); // Change to dark theme
      } else {
        currentTheme = ThemeData.light(); // Change to light theme
      }
    });
  }
}

void main() {
  runApp(ProfilePage());
}
