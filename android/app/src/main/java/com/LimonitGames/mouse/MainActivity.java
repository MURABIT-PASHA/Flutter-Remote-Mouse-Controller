package com.LimonitGames.mouse;

import androidx.annotation.NonNull;

import com.LimonitGames.mouse.socket.SocketManager;

import java.util.logging.Logger;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String METHOD_CHANNEL = "com.LimonitGames/socket";
    private static Logger LOGGER = Logger.getLogger("LIMONIT GAMES");
    SocketManager socketManager;
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), METHOD_CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("event")) {
                                socketManager = new SocketManager();
                                String data = call.arguments.toString();
                                LOGGER.info(data);
                                socketManager.sendMessage(data);
                               result.success("Success");
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

}
