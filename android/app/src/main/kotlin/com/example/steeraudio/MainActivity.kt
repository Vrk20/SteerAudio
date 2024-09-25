package com.example.steeraudio

import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.media.session.MediaSessionManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.media/info"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
          flutterEngine?.let {
            MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    "getCurrentMediaInfo" -> {
                        val mediaInfo = getCurrentMediaInfo()
                        result.success(mediaInfo)
                    }
                    "getAudioOutputDevice" -> {
                        val outputDevice = getAudioOutputDevice()
                        result.success(outputDevice)
                    }
                    else -> result.notImplemented()
                }
            }
        } ?: run {
            // Handle the case where flutterEngine is null (unlikely but safe to check)
            println("Flutter engine is null")
        }
    }
       
    private fun getCurrentMediaInfo(): Map<String, String> {
        val mediaSessionManager = getSystemService(MEDIA_SESSION_SERVICE) as MediaSessionManager
        val controllers = mediaSessionManager.getActiveSessions(null)
        val mediaInfo = mutableMapOf<String, String>()
    
        if (controllers.isNotEmpty()) {
            val controller = controllers[0] // Get the first active session
            val metadata = controller.metadata
            val mediaTitle = metadata?.getString(android.media.MediaMetadata.METADATA_KEY_TITLE) ?: "Unknown"
            val mediaArtist = metadata?.getString(android.media.MediaMetadata.METADATA_KEY_ARTIST) ?: "Unknown"
    
            mediaInfo["title"] = mediaTitle
            mediaInfo["artist"] = mediaArtist
        } else {
            // Handle case where no active sessions are found
            throw Exception("No active media sessions found.")
        }
    
        return mediaInfo
    }

    private fun getAudioOutputDevice(): String {
        val audioManager = getSystemService(AUDIO_SERVICE) as AudioManager
        val devices = audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)

        for (device in devices) {
            when (device.type) {
                AudioDeviceInfo.TYPE_BLUETOOTH_A2DP -> return "Bluetooth"
                AudioDeviceInfo.TYPE_BUILTIN_SPEAKER -> return "Built-in Speaker"
                AudioDeviceInfo.TYPE_WIRED_HEADPHONES -> return "Headphones"
                else -> continue
            }
        }

        return "Unknown"
    }
}
