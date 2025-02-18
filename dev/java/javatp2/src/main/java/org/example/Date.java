package org.example;

import java.util.Scanner;

public class Date {

    // attributes
    protected int chDay;
    protected int chMonth;
    protected int chYear;

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
                if (chDay > (isLeapYear ? 29 : 28))
                    return false;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                if (chDay > 30)
                    return false;
                break;
            default:
                break;
        }

        return true;
    }

    public int compareTo(Date parDate) {
        // Compare years first
        if (this.chYear != parDate.chYear) {
            return this.chYear - parDate.chYear;
        }
        // If years are equal, compare months
        if (this.chMonth != parDate.chMonth) {
            return this.chMonth - parDate.chMonth;
        }
        // If months are equal, compare days
        return this.chDay - parDate.chDay;
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

    public Date dateDuLendemain() {
        int jour = this.chDay;
        int mois = this.chMonth;
        int annee = this.chYear;

        jour++;
        // Vérifier si on dépasse le nombre de jours du mois
        int maxJours = 31;
        if (mois == 4 || mois == 6 || mois == 9 || mois == 11)
            maxJours = 30;
        else if (mois == 2) {
            maxJours = ((annee % 4 == 0 && annee % 100 != 0) || (annee % 400 == 0)) ? 29 : 28;
        }

        if (jour > maxJours) {
            jour = 1;
            mois++;
            if (mois > 12) {
                mois = 1;
                annee++;
            }
        }

        return new Date(jour, mois, annee);
    }

    public Date dateDelaVeille() {
        int jour = this.chDay;
        int mois = this.chMonth;
        int annee = this.chYear;

        jour--;
        if (jour < 1) {
            mois--;
            if (mois < 1) {
                mois = 12;
                annee--;
            }
            int maxJours = 31;
            if (mois == 4 || mois == 6 || mois == 9 || mois == 11)
                maxJours = 30;
            else if (mois == 2) {
                maxJours = ((annee % 4 == 0 && annee % 100 != 0) || (annee % 400 == 0)) ? 29 : 28;
            }
            jour = maxJours;
        }

        return new Date(jour, mois, annee);
    }
}