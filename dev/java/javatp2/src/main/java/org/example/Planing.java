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

    // Méthode qui retourne la première réservation
    public String getFirstResa() {
        for (Reservation reservation : reservations) {
            if (reservation != null) {
                return reservation.toString();
            }
        }
        return "Aucune réservation";
    }
    // Méthode qui retourne un tableau de réservations
    public Reservation[] getReservations() {
        return reservations;
    }

    // Méthode qui ajoute une réservation au tableau
    public boolean ajout(Reservation parReservation) {
        for (int i = 0; i < reservations.length; i++) {
            if (reservations[i] == null) {
                reservations[i] = parReservation;
                return true;
            }
        }
        return false;
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
