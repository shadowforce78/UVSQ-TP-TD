package org.example;

public class Planing {
    // Tablea d'objets de la classe Reservation
    private Reservation[] reservations;
    // Entier constant qui contient la taille du tableau
    private static final int TAILLE_TAB = 100;

    // Constructeur de la classe Planing
    public Planing() {
        reservations = new Reservation[TAILLE_TAB];
    }


    public String getFirstResa() {
        for (Reservation reservation : reservations) {
            if (reservation != null) {
                return reservation.toString();
            }
        }
        return "Aucune réservation";
    }
    // Méthode qui ajoute une réservation au tableau
    public void ajouter(Reservation reservation) {
        for (int i = 0; i < TAILLE_TAB; i++) {
            if (reservations[i] == null) {
                reservations[i] = reservation;
                return;
            }
        }
        throw new IllegalStateException("Le tableau est plein");
    }

    // Méthode qui affiche les réservations
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Reservation reservation : reservations) {
            if (reservation != null) {
                sb.append(reservation).append("\n");
            }
        }
        return sb.toString();
    }
}
