import 'package:coffee_and_company/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Image.asset(
                'assets/background_image.png',
                width: 250,
                height: 300,
              ),
            ),
            SizedBox(height: 250), // Spacer

            // Get Started Button
        ElevatedButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(fontSize: 18),
          ),
        ),
          ],
        ),
      ),
    );
  }
}


