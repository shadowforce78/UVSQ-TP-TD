package org.example;

import java.util.Scanner;

public class Date {

    // attributes
    public int chDay;
    public int chMonth;
    public int chYear;

    // constructor
    public Date(int jour, int month, int year) {
        this.chDay = jour;
        this.chMonth = month;
        this.chYear = year;
    }

    // method toString
    public String toString() {
        return chDay + "/" + chMonth + "/" + chYear;
    }


    // method isValid
    public Boolean isValid() {
        if (chDay < 1 || chDay > 31) {
            return false;
        }
        if (chMonth < 1 || chMonth > 12) {
            return false;
        }
        if (chYear <= 1582) {
            return false;
        }

        // Check for leap year
        boolean isLeapYear = (chYear % 4 == 0 && chYear % 100 != 0) || (chYear % 400 == 0);

        // Validate days in each month
        switch (chMonth) {
            case 2:
                if (chDay > (isLeapYear ? 29 : 28)) return false;
                break;
            case 4: case 6: case 9: case 11:
                if (chDay > 30) return false;
                break;
            default:
                break;
        }

        return true;
    }

    public static Date lireDate() {
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.print("Entrez le jour: ");
            int jour = scanner.nextInt();
            System.out.print("Entrez le mois: ");
            int mois = scanner.nextInt();
            System.out.print("Entrez l'année: ");
            int annee = scanner.nextInt();
            return new Date(jour, mois, annee);
        } finally {
            scanner.close();
        }
    }

}