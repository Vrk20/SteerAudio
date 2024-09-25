import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


class MediaInfo {
  static const platform = MethodChannel('com.example.media/info');

static Future<void> requestPermissions() async {
  // Check the current status of the notification permission
  var status = await Permission.notification.status;

  if (status.isGranted) {
    // Permission is already granted
    print('Notification permission is already granted');
  } else if (status.isDenied || status.isRestricted) {
    // Request permission from the user
    var result = await Permission.notification.request();
    
    if (result.isGranted) {
      // Permission is granted
      print('Notification permission granted');
    } else {
      // Permission is denied
      print('Notification permission denied');
      // Optionally, you can direct the user to app settings to enable it
      openAppSettings();
    }
  } else {
    // Handle other statuses if necessary (e.g., permanently denied)
    print('Notification permission status: ${status}');
  }
  
 var mediaPermission = await Permission.manageExternalStorage.status;

  if (mediaPermission.isGranted) {
    print('Manage External Storage permission is already granted');
  } else if (mediaPermission.isDenied || mediaPermission.isRestricted) {
    var result = await Permission.manageExternalStorage.request();
    
    if (result.isGranted) {
      print('Manage External Storage permission granted');
    } else {
      print('Manage External Storage permission denied');
      openAppSettings(); // Direct user to app settings
    }
  } else if (mediaPermission.isPermanentlyDenied) {
    print('Manage External Storage permission permanently denied');
    openAppSettings(); // Direct user to app settings
  }

   var medialibpermission = await Permission.mediaLibrary.status;

  if (medialibpermission.isGranted) {
    print('Manage External Storage permission is already granted');
  } else if (medialibpermission.isDenied || medialibpermission.isRestricted) {
    var result = await Permission.mediaLibrary.request();
    
    if (result.isGranted) {
      print('Manage External Storage permission granted');
    } else {
      print('Manage External Storage permission denied');
      openAppSettings(); // Direct user to app settings
    }
  } else if (medialibpermission.isPermanentlyDenied) {
    print('Manage External Storage permission permanently denied');
    openAppSettings(); // Direct user to app settings
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
