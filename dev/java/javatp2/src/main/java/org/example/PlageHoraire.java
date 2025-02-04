package org.example;

public class PlageHoraire {
    private static final int DUREE_MIN = 15;
    private Horaire debut;
    private Horaire fin;

    public PlageHoraire(Horaire debut, Horaire fin) {
        this.debut = debut;
        this.fin = fin;
        int duree = getDuree();
        if (duree < DUREE_MIN) {
            throw new IllegalArgumentException("La durée doit être d'au moins " + DUREE_MIN + " minutes");
        }
    }

    public int getDuree() {
        int debutMinutes = debut.getHeure() * 60 + debut.getMinutes();
        int finMinutes = fin.getHeure() * 60 + fin.getMinutes();
        return finMinutes - debutMinutes;
    }

    public String toString() {
        return debut + " - " + fin + " (" + getDuree() + " minutes)";
    }
}