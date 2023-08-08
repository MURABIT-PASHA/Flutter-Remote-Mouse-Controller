package com.LimonitGames.mouse.socket;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.logging.Logger;

public class SocketManager {
    private static Logger LOGGER = Logger.getLogger("LIMONIT");
    Socket mSocket;
    PrintWriter mPrintWriter;

    public void sendMessage(String message){
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    mSocket = new Socket("192.168.43.10", 7800);
                    mPrintWriter = new PrintWriter(mSocket.getOutputStream());
                    mPrintWriter.write(message);
                    mPrintWriter.flush();
                    mPrintWriter.close();
                    mSocket.close();
                } catch (IOException e) {
                    LOGGER.info(e.getMessage());
                }
            }
        });
        thread.start();
    }
}
