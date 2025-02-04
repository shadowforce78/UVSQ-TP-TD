package org.example;

public class HoraireClient {
    public static void main(String[] args) {
        Horaire lHeure = new Horaire(10, 15);
        System.out.println(lHeure);
        System.out.println(lHeure.toMinutes());
        lHeure.setHeure(12);
        lHeure.setQuartHeure(30);
        System.out.println(lHeure);
        System.out.println(lHeure.toMinutes());
    }
}
