package org.example;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Horaire {
    private int chHeure;
    private int chQuartHeure;

    public Horaire(int parHeure, int parQuartHeure){
        chHeure = parHeure;
        chQuartHeure = parQuartHeure;
    }

    public int toMinutes(){
        return chHeure * 60 + chQuartHeure;
    }

    public int getHeure(){
        return chHeure;
    }

    public int getQuartHeure(){
        return chQuartHeure;
    }

    public void setHeure(int parHeure){
        chHeure = parHeure;
    }

    public void setQuartHeure(int parQuartHeure){
        chQuartHeure = parQuartHeure;
    }

    public String toString(){
        return chHeure + "h" + chQuartHeure;
    }
}