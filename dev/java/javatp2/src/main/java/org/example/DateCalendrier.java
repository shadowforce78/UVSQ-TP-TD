package org.example;

import java.util.Calendar;

public class DateCalendrier {
    public int chJourSemaine;
    public int chJour;
    public int chMois;
    public int chAnnee;

    public DateCalendrier() {
        Calendar aujourd_hui = Calendar.getInstance();
        this.chJour = aujourd_hui.get(Calendar.DAY_OF_MONTH);
        this.chMois = aujourd_hui.get(Calendar.MONTH) + 1; // Calendar.MONTH commence à 0
        this.chAnnee = aujourd_hui.get(Calendar.YEAR);

        // Conversion du jour de la semaine de Calendar (dimanche = 1) vers notre format
        // (lundi = 1)
        int jourSemaine = aujourd_hui.get(Calendar.DAY_OF_WEEK);
        this.chJourSemaine = (jourSemaine == Calendar.SUNDAY) ? 7 : jourSemaine - 1;
    }

    public DateCalendrier(int jour, int mois, int annee) {
        this.chJour = jour;
        this.chMois = mois;
        this.chAnnee = annee;

        // Calcul du jour de la semaine
        Calendar calendrier = Calendar.getInstance();
        calendrier.set(annee, mois - 1, jour);
        int jourSemaine = calendrier.get(Calendar.DAY_OF_WEEK);
        this.chJourSemaine = (jourSemaine == Calendar.SUNDAY) ? 7 : jourSemaine - 1;
    }
}
