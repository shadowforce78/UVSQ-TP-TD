package org.example;

public class Date {

    // attributs
    public int chDay;
    public int chMonth;
    public int chYear;

    // constructeur
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
        if (chMonth == 2) {
            if (isLeapYear) {
                return chDay <= 29;
            } else {
                return chDay <= 28;
            }
        } else if (chMonth == 4 || chMonth == 6 || chMonth == 9 || chMonth == 11) {
            return chDay <= 30;
        } else {
            return true;
        }
    }

}