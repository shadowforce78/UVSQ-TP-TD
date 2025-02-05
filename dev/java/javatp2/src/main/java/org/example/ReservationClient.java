package org.example;

public class ReservationClient {
    public static void main(String[] args) {
        PlageHoraire lPlage = new PlageHoraire(new Horaire(8, 30), new Horaire(9, 35));
        Reservation lReservation = new Reservation("Rendez-vous", lPlage, "2021-09-01");
        System.out.println(lReservation);
    }
}
