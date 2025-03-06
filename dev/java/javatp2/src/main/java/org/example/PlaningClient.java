package org.example;

public class PlaningClient {
    public static void main(String[] args) {
        Planing planing = new Planing();

        // Ajout de réservations avec des dates différentes
        try {
            planing.ajout(
                    new Reservation("Jean", new PlageHoraire(new Horaire(8, 0), new Horaire(9, 0)), "2023-12-15"));
            planing.ajout(
                    new Reservation("Paul", new PlageHoraire(new Horaire(9, 0), new Horaire(10, 0)), "2023-12-01"));
            planing.ajout(
                    new Reservation("Jacques", new PlageHoraire(new Horaire(10, 0), new Horaire(11, 0)), "2023-12-30"));
            planing.ajout(
                    new Reservation("Marie", new PlageHoraire(new Horaire(11, 0), new Horaire(12, 0)), "2023-12-05"));
        } catch (Exception e) {
            System.out.println("Erreur : " + e.getMessage());
        }

        // Affichage avant le tri
        System.out.println("=== Avant le tri ===");
        System.out.println(planing.toString());

        // Application du tri
        planing.triSelection();

        // Affichage après le tri
        System.out.println("=== Après le tri ===");
        System.out.println(planing.toString());
    }
}
