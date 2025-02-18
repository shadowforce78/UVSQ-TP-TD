package org.example;

import java.util.Calendar;

public class DateCalendrier extends Date {
    private int chJourSemaine;

    public DateCalendrier() {
        super(Calendar.getInstance().get(Calendar.DAY_OF_MONTH),
                Calendar.getInstance().get(Calendar.MONTH) + 1,
                Calendar.getInstance().get(Calendar.YEAR));

        Calendar aujourd_hui = Calendar.getInstance();
        int jourSemaine = aujourd_hui.get(Calendar.DAY_OF_WEEK);
        this.chJourSemaine = (jourSemaine == Calendar.SUNDAY) ? 7 : jourSemaine - 1;
    }

    public DateCalendrier(int jour, int mois, int annee) {
        super(jour, mois, annee);

        Calendar calendrier = Calendar.getInstance();
        calendrier.set(annee, mois - 1, jour);
        int jourSemaine = calendrier.get(Calendar.DAY_OF_WEEK);
        this.chJourSemaine = (jourSemaine == Calendar.SUNDAY) ? 7 : jourSemaine - 1;
    }

    public int getJourSemaine() {
        return this.chJourSemaine;
    }

    @Override
    public DateCalendrier dateDuLendemain() {
        Date demain = super.dateDuLendemain();
        return new DateCalendrier(demain.chDay, demain.chMonth, demain.chYear);
    }

    @Override
    public DateCalendrier dateDelaVeille() {
        Date hier = super.dateDelaVeille();
        return new DateCalendrier(hier.chDay, hier.chMonth, hier.chYear);
    }
}
