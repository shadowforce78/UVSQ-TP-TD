package calculator;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatriceTest {

    @BeforeEach
    void setUp() {
        System.out.println("Test started");
    }

    @AfterEach
    void tearDown() {
        System.out.println("Test finished");
    }

    @Test
    void addition() {
        System.out.println("Test addition");

        // Test avec a négatif et b positif
        assertTrue(Calculatrice.addition(-3, 2) == -1, "test échoué pour a négatif et b positif");

        // Test avec a positif et b négatif
        assertEquals(Calculatrice.addition(3, -2), 1, "test échoué pour a positif et b négatif");

        // Test avec a et b positifs
        assertEquals(Calculatrice.addition(3, 4), 7, "test échoué pour a positif et b positif");

        // Test avec a et b négatifs
        assertEquals(Calculatrice.addition(-5, -3), -8, "test échoué pour a négatif et b négatif");

        // Test avec zéro
        assertEquals(Calculatrice.addition(5, 0), 5, "test échoué pour b égal à zéro");
        assertEquals(Calculatrice.addition(0, 7), 7, "test échoué pour a égal à zéro");
        assertEquals(Calculatrice.addition(0, 0), 0, "test échoué pour a et b égaux à zéro");

        // Test avec grands nombres
        assertEquals(Calculatrice.addition(100, 200), 300, "test échoué pour grands nombres positifs");
        assertEquals(Calculatrice.addition(-100, -200), -300, "test échoué pour grands nombres négatifs");

        System.out.println("Tous les tests sont terminés !");
    }
}