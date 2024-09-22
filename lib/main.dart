import 'package:flutter/material.dart';
import 'media_info.dart';
import 'package:permission_handler/permission_handler.dart'; // For handling permissions

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Optional: A dark theme
      home: MediaScreen(),
    );
  }
}

class MediaScreen extends StatefulWidget {
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  String mediaTitle = "Unknown";
  String mediaArtist = "Unknown";
  String audioOutput = "Unknown";

 @override
  void initState() {
    super.initState();
    MediaInfo.requestPermissions(); // Check and request notification access
  }

  // Method to fetch media info and update the state
  void fetchMediaInfo() async {
  try {
    Map<String, String> mediaInfo = await MediaInfo.getCurrentMediaInfo();
    String outputDevice = await MediaInfo.getAudioOutputDevice();

    setState(() {
      mediaTitle = mediaInfo['title'] ?? "Unknown";
      mediaArtist = mediaInfo['artist'] ?? "Unknown";
      audioOutput = outputDevice;
    });
  } catch (e) {
    print("Error fetching media info: $e");
    setState(() {
      mediaTitle = "Unknown";
      mediaArtist = "Unknown";
      audioOutput = "Unknown";
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Media Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Media Title: $mediaTitle", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Media Artist: $mediaArtist", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Audio Output: $audioOutput", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchMediaInfo,
              child: Text("Get Current Media Info"),
            ),
          ],
        ),
      ),
    );
  }
}


void openNotificationAccessSettings() async {
  bool isNotificationGranted = await Permission.notification.isGranted;
  
  if (!isNotificationGranted) {
    await openAppSettings();  // Opens the settings for the app so users can enable notification access
  }
}