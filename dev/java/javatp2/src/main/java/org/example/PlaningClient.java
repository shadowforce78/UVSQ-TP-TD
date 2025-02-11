package org.example;

public class PlaningClient {
    public static void main(String[] args) {
        Planing planing = new Planing();
        planing.ajouter(new Reservation("Jean", new PlageHoraire(new Horaire(8, 0), new Horaire(9, 0)), "2021-01-01"));
        planing.ajouter(new Reservation("Paul", new PlageHoraire(new Horaire(9, 0), new Horaire(10, 0)), "2021-01-01"));
        planing.ajouter(new Reservation("Jacques", new PlageHoraire(new Horaire(10, 0), new Horaire(11, 0)), "2021-01-01"));
        System.out.println(planing.toString());
    }
}
