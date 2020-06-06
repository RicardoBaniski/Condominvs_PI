package com.example.condominvs;

        import java.sql.Timestamp;

public class Util {
    public static long getTimeStamp(){
        return new Timestamp(System.currentTimeMillis()).getTime();
    }
}
