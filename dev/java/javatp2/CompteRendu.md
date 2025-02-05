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
```

### 2) Qu'est-ce qu'un champ final?

Un champ final est un champ qui ne peut être modifié après son initialisation.

### 3) Qu'est-ce qu'un champ static?

Un champ static est un champ qui appartient à la classe et non à l'objet. Il est partagé par tous les objets de la classe.

### 4) Dans une classe PlageHoraireClient, testez le constructeur et la méthode toString() de la classe PlageHoraire.

```java
public class PlageHoraireClient {
    public static void main(String[] args) {
        PlageHoraire lPlage = new PlageHoraire(new Horaire(8, 30), new Horaire(8, 35));
        System.out.println(lPlage);
    }
}
```

### 5.1) Quelles sont les conditions à respecter pour qu'une plage horaire soit valide?

Pour qu'une plage horaire soit valide, la durée de la plage doit être d'au moins 15 minutes.

### 5.2) Ajoutez une méthode boolean estValide() à la classe PlageHoraire qui retourne true si la plage horaire est valide, false sinon.

```java
public boolean estValide() {
    return getDuree() >= DUREE_MIN;
}
```

### 6) Ajoutez la méthode durée() qui retourne la durée d'une plage horaire supposée valide, complétez ensuite la méthode toString() pour que la chaine retournée contienne la durée.

```java
public int duree() {
    if (!estValide()) {
        throw new IllegalStateException("La plage horaire n'est pas valide");
    }
    return getDuree();
}

public String toString() {
    return debut + " - " + fin + " (" + duree() + " minutes)";
}
```

### 7) Ajoutez la méthode compareTo() qui prend un paramètre de type PlageHoraire et qui retourne : un entier négatif si l'objet this précède la plage horaire reçue en paramètre, un entier positif si la plage horaire reçue en argument précède l'objet this, 0 dans tous les autres cas
```java
public int compareTo(PlageHoraire autre) {
        int debutThis = this.debut.getHeure() * 60 + this.debut.getMinutes();
        int debutAutre = autre.debut.getHeure() * 60 + autre.debut.getMinutes();
        
        if (debutThis < debutAutre) {
            return -1;
        } else if (debutThis > debutAutre) {
            return 1;
        }
        return 0;
    }
```

## 1.3 La classe Reservation
### 3) Ecrivez la méthode compareTo()

```java
public int compareTo(Reservation autre) {
        int compareDate = this.chDate.compareTo(autre.getDate());
        if (compareDate != 0) {
            return compareDate;
        }
        return chPlageHoraire.compareTo(autre.getPlageHoraire());
    }
```