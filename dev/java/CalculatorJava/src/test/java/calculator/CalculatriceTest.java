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

        // P1 Test avec a et b positif
        assertTrue(Calculatrice.addition(3, 2) == 5, "test échoué pour a et b positif");

        // P2 Test avec a = 0 et b > 0
        assertTrue(Calculatrice.addition(0, 4) == 4, "test échoué pour a = 0 et b > 0");

        // P3 Test avec a > 0 et b = 0
        assertTrue(Calculatrice.addition(5, 0) == 5, "test échoué pour a > 0 et b = 0");

        // P4 Test avec a = 0 et b < 0
        assertTrue(Calculatrice.addition(0, -3) == -3, "test échoué pour a = 0 et b < 0");

        // P5 Test avec a < 0 et b = 0
        assertTrue(Calculatrice.addition(-7, 0) == -7, "test échoué pour a < 0 et b = 0");

        // P6 Test avec a < 0 et b < 0
        assertTrue(Calculatrice.addition(-4, -6) == -10, "test échoué pour a < 0 et b < 0");

        // P7 Test avec a = 0 et b = 0
        assertTrue(Calculatrice.addition(0, 0) == 0, "test échoué pour a = 0 et b = 0");

        // P8 Test avec a < 0 et b > 0 et |a| > b
        assertTrue(Calculatrice.addition(-6, 2) == -4, "test échoué pour a < 0 et |a| > b");

        // P9 Test avec a < 0 et b > 0 et |a| < b
        assertTrue(Calculatrice.addition(-3, 5) == 2, "test échoué pour a < 0 et |a| < b");

        // P10 Test avec a < 0 et b > 0 et |a| = |b|
        assertTrue(Calculatrice.addition(-4, 4) == 0, "test échoué pour a < 0 et |a| = |b|");

        // P11 Test avec a > 0 et b < 0 et |b| > a
        assertTrue(Calculatrice.addition(3, -5) == -2, "test échoué pour a > 0 et |b| > a");

        // P12 Test avec a > 0 et b < 0 et |b| < a
        assertTrue(Calculatrice.addition(6, -2) == 4, "test échoué pour a > 0 et |b| < a");

        // P13 Test avec a > 0 et b < 0 et |b| = a
        assertTrue(Calculatrice.addition(7, -7) == 0, "test échoué pour a > 0 et |b| = a");

        System.out.println("Tous les tests sont terminus !");
    }
}