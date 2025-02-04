# Exercice 1
## 1.1 La classe horaire

### 1) Quelles méthodes appelle-t-on accesseurs? A quoi servent-ils? Comment est construit leur en-tête?
Les accesseurs sont des méthodes qui permettent d'accéder à des attributs privés d'une classe. Ils servent à lire ou à modifier la valeur d'un attribut privé. L'en-tête d'un accesseur est construit de la manière suivante:
```java
public type getNomAttribut() {
    return nomAttribut;
}
```

### 2) Quelles méthodes appelle-t-on modifieurs? A quoi servent-ils? Comment est construit leur en-tête?
Les modifieurs sont des méthodes qui permettent de modifier la valeur d'un attribut privé d'une classe. L'en-tête d'un mutateur est construit de la manière suivante:
```java
public void setNomAttribut(type nomAttribut) {
    this.nomAttribut = nomAttribut;
}
```

### 3) Que retourne la méthode toMinutes()?
La méthode toMinutes() retourne le nombre de minutes pour une horaire donnée. (Exemple: 2h30 retourne 150 minutes)

### 4) Déclarez, instanciez et initialisez un objet de la classe Horaire et testez les différentes méthodes.
```java
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
```	

## 1.2 La classe PlageHoraire
### 1) Ecrit la classe PlageHoraire permettant de représenter des plages horaires formées d'un horaire de début, d'un horaire de fin et d'une durée minimum, elle contient : un champ final et static pour la durée minimum, un champ pour l'horaire de début, un champ pour l'horaire de fin, un constructeur qui reçoit des paramètres a affecter aux champs, une méthode toString()

```java
public class PlageHoraire {
    private static final int DUREE_MIN = 15;
    private Horaire debut;
    private Horaire fin;

    public PlageHoraire(Horaire debut, Horaire fin) {
        this.debut = debut;
        this.fin = fin;
    }

    public String toString() {
        return "Plage horaire de " + debut + " à " + fin;
    }
}
```