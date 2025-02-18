package org.example;

public class ClientDateCalendrier {
    public static void main(String[] args) {
        // Test du constructeur par défaut (date d'aujourd'hui)
        System.out.println("=== Test du constructeur par défaut ===");
        DateCalendrier dateAujourdhui = new DateCalendrier();
        System.out.println(dateAujourdhui.toString());

        // Test du constructeur avec paramètres
        System.out.println("\n=== Test de quelques dates spécifiques ===");
        DateCalendrier noel2023 = new DateCalendrier(25, 12, 2023);
        System.out.println(noel2023.toString());

        DateCalendrier jourDeLAn = new DateCalendrier(1, 1, 2024);
        System.out.println(jourDeLAn.toString());

        DateCalendrier quatorzeJuillet = new DateCalendrier(14, 7, 2024);
        System.out.println(quatorzeJuillet.toString());
    }
}
