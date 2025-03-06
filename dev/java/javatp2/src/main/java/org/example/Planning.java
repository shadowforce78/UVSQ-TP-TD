package org.example;

import java.util.ArrayList;
import java.util.List;

public class Planning implements ConstantesErreur {
    private List<DateCalendrier> reservations;
    private int capaciteMax;

    public Planning(int capaciteMax) {
        this.reservations = new ArrayList<>();
        this.capaciteMax = capaciteMax;
    }

    /**
     * Ajoute une réservation au planning
     * 
     * @param date La date de réservation à ajouter
     * @throws ExceptionPlanning
     *                           - Code 0: Réservation invalide
     *                           - Code 1: Planning complet
     *                           - Code 2: Réservation incompatible
     */
    public void ajout(DateCalendrier date) throws ExceptionPlanning {
        // Vérification de la validité de la date
        if (date == null || !estDateValide(date)) {
            throw new ExceptionPlanning(0); // Réservation invalide
        }

        // Vérification si le planning est plein
        if (reservations.size() >= capaciteMax) {
            throw new ExceptionPlanning(1); // Planning complet
        }

        // Vérification de compatibilité avec les réservations existantes
        if (!estCompatible(date)) {
            throw new ExceptionPlanning(2); // Réservation incompatible
        }

        // Ajout de la réservation
        reservations.add(date);
    }

    /**
     * Vérifie si une date est valide
     */
    private boolean estDateValide(DateCalendrier date) {
        return date.isValid();
    }

    /**
     * Vérifie si une date est compatible avec les réservations existantes
     */
    private boolean estCompatible(DateCalendrier date) {
        // Exemple simple : vérifier qu'il n'y a pas déjà une réservation à cette date
        for (DateCalendrier reservation : reservations) {
            if (memeJour(reservation, date)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Vérifie si deux dates sont le même jour
     */
    private boolean memeJour(DateCalendrier date1, DateCalendrier date2) {
        return date1.chDay == date2.chDay &&
                date1.chMonth == date2.chMonth &&
                date1.chYear == date2.chYear;
    }

    /**
     * Retourne les réservations actuelles
     */
    public List<DateCalendrier> getReservations() {
        return new ArrayList<>(reservations);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Planning (");
        sb.append(reservations.size()).append("/").append(capaciteMax).append(") :\n");

        for (DateCalendrier date : reservations) {
            sb.append("- ").append(date.toString()).append("\n");
        }

        return sb.toString();
    }
}
