// lib/pages/device_selection_page.dart
import 'package:flutter/material.dart';
import 'music_card.dart'; // Import MusicCard to reuse in this page

class DeviceSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> devices = [
    {"icon": Icons.headset, "name": "Rockerz 333ANC"},
    {"icon": Icons.phone_android, "name": "This phone"},
    {"icon": Icons.speaker, "name": "Stone 620"},
    {"icon": Icons.headphones, "name": "Air Buds"},
    {"icon": Icons.laptop, "name": "LAPTOP-K6EQ6SGB"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Music card at the top
            MusicCard(),
            SizedBox(height: 20), // Space between the card and list
            // List of selectable devices
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.blueGrey[900],
                    child: ListTile(
                      leading: Icon(
                        devices[index]["icon"],
                        color: Colors.white,
                      ),
                      title: Text(
                        devices[index]["name"],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Handle device selection logic here
                        print("Selected: ${devices[index]["name"]}");
                      },
                    ),
                  );
                },
              ),
            ),
            // Done button at the bottom
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // Your onPressed logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('DONE'),
                )),
          ],
        ),
      ),
    );
  }
}
