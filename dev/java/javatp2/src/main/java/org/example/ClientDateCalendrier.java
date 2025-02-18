package org.example;

public class ClientDateCalendrier {
    public static void main(String[] args) {
        // Test du constructeur par défaut (date d'aujourd'hui)
        System.out.println("Test du constructeur par défaut :");
        DateCalendrier dateAujourdhui = new DateCalendrier();
        System.out.println("Aujourd'hui : " + dateAujourdhui.chJour + "/" +
                dateAujourdhui.chMois + "/" + dateAujourdhui.chAnnee);
        System.out.println("Jour de la semaine : " + dateAujourdhui.chJourSemaine);

        // Test du constructeur avec paramètres
        System.out.println("\nTest du constructeur avec paramètres :");
        DateCalendrier dateSpecifique = new DateCalendrier(25, 12, 2023);
        System.out.println("Date spécifique : " + dateSpecifique.chJour + "/" +
                dateSpecifique.chMois + "/" + dateSpecifique.chAnnee);
        System.out.println("Jour de la semaine : " + dateSpecifique.chJourSemaine);
    }
}
