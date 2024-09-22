import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


class MediaInfo {
  static const platform = MethodChannel('com.example.media/info');

  static Future<void> requestPermissions() async {
    if (await Permission.notification.request().isGranted) {
      // Permission is granted
    } else {
      // Permission is denied
      print('Notification permission denied');
    }
  }

  // Method to get currently playing media information
  static Future<Map<String, String>> getCurrentMediaInfo() async {
    try {
      final Map<dynamic, dynamic> result = await platform.invokeMethod('getCurrentMediaInfo');
      return Map<String, String>.from(result);
    } on PlatformException catch (e) {
      print("Failed to get media info: '${e.message}'.");
      return {};
    }
  }

  // Method to get audio output device (Bluetooth, Speaker, etc.)
  static Future<String> getAudioOutputDevice() async {
    try {
      final String result = await platform.invokeMethod('getAudioOutputDevice');
      return result;
    } on PlatformException catch (e) {
      print("Failed to get audio output device: '${e.message}'.");
      return "Unknown";
    }
  }
}
