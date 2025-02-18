package org.example;

public class ClientDateCalendrier {
    public static void main(String[] args) {
        // Test du constructeur par défaut (date d'aujourd'hui)
        System.out.println("=== Test du constructeur par défaut ===");
        DateCalendrier dateAujourdhui = new DateCalendrier();
        System.out.println("Aujourd'hui : " + dateAujourdhui.toString());
        System.out.println("Jour de la semaine : " + dateAujourdhui.getJourSemaine());

        // Test du constructeur avec paramètres
        System.out.println("\n=== Test du constructeur avec paramètres ===");
        DateCalendrier noel2023 = new DateCalendrier(25, 12, 2023);
        System.out.println("Noël 2023 : " + noel2023.toString());
        System.out.println("Jour de la semaine : " + noel2023.getJourSemaine());

        // Test de dateDuLendemain() et dateDelaVeille()
        System.out.println("\n=== Test des méthodes dateDuLendemain et dateDelaVeille ===");
        DateCalendrier lendemain = noel2023.dateDuLendemain();
        DateCalendrier veille = noel2023.dateDelaVeille();
        System.out.println("Lendemain de Noël : " + lendemain.toString());
        System.out.println("Veille de Noël : " + veille.toString());

        // Test de fin d'année
        System.out.println("\n=== Test de changement d'année ===");
        DateCalendrier finAnnee = new DateCalendrier(31, 12, 2023);
        DateCalendrier debutAnnee = finAnnee.dateDuLendemain();
        System.out.println("Fin d'année : " + finAnnee.toString());
        System.out.println("Début d'année suivante : " + debutAnnee.toString());
    }
}
