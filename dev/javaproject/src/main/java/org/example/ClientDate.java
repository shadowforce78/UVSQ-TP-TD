package org.example;

import java.lang.reflect.Array;
import java.util.List;

public class ClientDate {
    public static void main(String[] args) {
        Date date1 = new Date(34, 4, 2022);
        Date date2 = new Date(30,2,2022);
        Date date3 = new Date(31,13,2021);
        Date date4 = new Date(29,2,2020);
        Date date5 = new Date(29,2,2060);
        Date date6 = new Date(29,2,2100);
        Date date7 = new Date(29,2,2020);
        Date date8 = new Date(29,2,2013);

        List<Date> dates = List.of(date1, date2, date3, date4, date5, date6, date7, date8);
        // Test isValid for each date
        for (Date date : dates) {
            System.out.println(date + " is valid: " + date.isValid());
        }
    }
}