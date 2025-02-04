package org.example;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ClientDate {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Date> dates = new ArrayList<>();

        System.out.println("Combien de dates voulez-vous vérifier ?");
        int numDates = scanner.nextInt();

        for (int i = 0; i < numDates; i++) {
            System.out.println("\nDate " + (i + 1) + ":");
            dates.add(Date.lireDate());
        }

        // Test isValid for each date
        for (Date date : dates) {
            System.out.println(date + " is valid: " + date.isValid());
        }

        scanner.close();
    }
}