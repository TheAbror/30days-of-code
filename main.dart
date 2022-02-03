// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'Mc Donald`s',
    'Burger King',
    'Yapona Mama',
    'BroadWay',
    'MaxWay',
    'Street77',
    'Milliy',
  ];
  int randomnumber = 7;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var myBNB = BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          label: '',
        ),
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pick a restaurant'),
          backgroundColor: Colors.red,
        ),
        bottomNavigationBar: myBNB,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: Text(
                'Where do you want to eat?',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),

            // if (randomnumber == null)
            randomnumber == 7
                ? Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Random restaurant\n will  be displayed',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      restaurants[randomnumber].toString(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
            SizedBox(height: 10),
            SizedBox(height: 10),

            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
                textStyle:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                setState(() {
                  updateIndex();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Pick a restaurant'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      randomnumber = index;
    });
  }
}
