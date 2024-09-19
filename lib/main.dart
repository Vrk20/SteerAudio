// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/music_card.dart'; // Make sure the path is correct
import 'pages/device_selection_page.dart'; // Make sure the path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // To match the dark background
      home: MusicCardScreen(),
    );
  }
}

class MusicCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeviceSelectionPage()),
              );
            },
            child: MusicCard(),
          ),
          SizedBox(height: 10), // Space between cards
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeviceSelectionPage()),
              );
            },
            child: MusicCard(),
          ),
        ],
      ),
    );
  }
}
