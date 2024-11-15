package com.example.sonalee_app

import android.app.Dialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    private val methodChannelName = "com.bajaj.com/method_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        val methodChannel = MethodChannel(messenger, methodChannelName)

        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "getResult") {
                result.success("Result from android")
            } else if (call.method == "showDialog") {
                val message = call.arguments.toString()
                val dialog = Dialog(activity)
                dialog.setTitle(message)
                dialog.show()
            } else {
                result.error("1", "Error", "No method found")
            }
        }
    }
}



