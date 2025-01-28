package org.example;

public class ClientDate {
    public static void main(String[] args) {
        int day = 1;
        int month = 13;
        int year = 2021;
        Date date = new Date(day, month, year);
        if (date.isValid()){
            System.out.println(date.toString());
        } else {
            System.out.println("Date invalide");
        }
    }
}