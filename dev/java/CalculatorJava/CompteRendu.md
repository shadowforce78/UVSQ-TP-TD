# Programmation de la calculatrice

## 1.1)

    Créé le projet Maven

## 1.2)

    Quels sont les répertoires créés par Maven dans votre projet ?
        - Le répertoire src/main/java contient les sources Java du projet.
        - Le répertoire src/main/resources contient les ressources du projet.
        - Le répertoire src/test/java contient les sources de test Java du projet.
        - Le répertoire target contient les fichiers générés par Maven.
        - Le fichier pom.xml contient la configuration du projet.

-

## 1.3)

    Dans le répertoire src/main/java, créez un package, puis une classe Calculatrice.

## 1.4)

    Codez une première version de la première opération de votre calculatrice en utilisant seulement l'opération + 1.

    ```java
    public class Calculatrice {
        public int addition(int a) {
            return a + 1;
        }
    }
    ```

## 2.4)

    ```java
    package calculator;

    import org.junit.jupiter.api.AfterEach;
    import org.junit.jupiter.api.BeforeEach;
    import org.junit.jupiter.api.Test;

    import static org.junit.jupiter.api.Assertions.\*;
    class CalculatriceTest {

        @BeforeEach
        void setUp() {
        }

        @AfterEach
        void tearDown() {
        }

        @Test
        void addition() {
        }

    }
    ``` 
Quelles sont les méthodes de la classe CalculatriceTest ? - setUp() - tearDown() - addition()

## 2.5)

    Ajoutez des instructions d'affichage dans chacune des 3 méthodes puis éxectuez le test, que constatez-vous ?
    
    ```java 
    @BeforeEach
    void setUp() {
        System.out.println("Début du test");
    }

    @AfterEach
    void tearDown() {
        System.out.println("Fin du test");
    }

    @Test
    void addition() {
        System.out.println("Test d'addition");
    }
    ```
    - On constate que les méthodes setUp() et tearDown() sont exécutées avant et après le test d'addition().
    - On constate que le test d'addition() est exécuté après les méthodes setUp() et avant la méthode tearDown().