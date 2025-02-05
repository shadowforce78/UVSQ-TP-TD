package org.example;

public class PlageHoraireClient {
    public static void main(String[] args) {
        PlageHoraire lPlage = new PlageHoraire(new Horaire(8, 30), new Horaire(10, 0));
        System.out.println(lPlage);
    }
}