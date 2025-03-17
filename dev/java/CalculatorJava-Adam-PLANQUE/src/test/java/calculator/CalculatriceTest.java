package calculator;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculatriceTest {

    @BeforeEach
    void setUp() {
    }

    @AfterEach
    void tearDown() {
    }

    @Test
    void addition() {

        System.out.println("Début des tests pour la méthode addition");

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

        System.out.println("Fin des tests pour la méthode addition");
    }

    @Test
    void soustraction() {
        System.out.println("Début des tests pour la méthode soustraction");
        // P1 Test avec a > 0 et b > 0 (a - b > 0)
        assertTrue(Calculatrice.soustraction(5, 2) == 3, "test échoué pour a > 0 et b > 0");

        // P2 Test avec a = 0 et b > 0 (c = -b < 0)
        assertTrue(Calculatrice.soustraction(0, 4) == -4, "test échoué pour a = 0 et b > 0");

        // P3 Test avec a > 0 et b = 0 (c = a > 0)
        assertTrue(Calculatrice.soustraction(3, 0) == 3, "test échoué pour a > 0 et b = 0");

        // P4 Test avec a < 0 et b < 0 (c = a - b < 0)
        assertTrue(Calculatrice.soustraction(-5, -2) == -3, "test échoué pour a < 0 et b < 0");

        // P5 Test avec a = 0 et b < 0 (c = -b > 0)
        assertTrue(Calculatrice.soustraction(0, -3) == 3, "test échoué pour a = 0 et b < 0");

        // P6 Test avec a < 0 et b = 0 (c = a < 0)
        assertTrue(Calculatrice.soustraction(-4, 0) == -4, "test échoué pour a < 0 et b = 0");

        // P7 Test avec a = 0 et b = 0 (c = 0)
        assertTrue(Calculatrice.soustraction(0, 0) == 0, "test échoué pour a = 0 et b = 0");

        // P8 Test avec a < 0 et b > 0 (c = a - b < 0)
        assertTrue(Calculatrice.soustraction(-2, 3) == -5, "test échoué pour a < 0 et b > 0");

        // P9 Test avec a > 0 et b < 0 (c = a - b > 0)
        assertTrue(Calculatrice.soustraction(4, -2) == 6, "test échoué pour a > 0 et b < 0");

        System.out.println("Fin des tests pour la méthode soustraction");
    }

    @Test
    void multiplication() {
        System.out.println("Début des tests pour la méthode multiplication");
        // P1 Test avec a > 0 et b > 0 (c = a * b > 0)
        assertTrue(Calculatrice.multiplication(3, 2) == 6, "test échoué pour a > 0 et b > 0");

        // P2 Test avec a = 0 et b > 0 (c = 0)
        assertTrue(Calculatrice.multiplication(0, 4) == 0, "test échoué pour a = 0 et b > 0");

        // P3 Test avec a > 0 et b = 0 (c = 0)
        assertTrue(Calculatrice.multiplication(5, 0) == 0, "test échoué pour a > 0 et b = 0");

        // P4 Test avec a < 0 et b < 0 (c = a * b > 0)
        assertTrue(Calculatrice.multiplication(-3, -2) == 6, "test échoué pour a < 0 et b < 0");

        // P5 Test avec a = 0 et b < 0 (c = 0)
        assertTrue(Calculatrice.multiplication(0, -3) == 0, "test échoué pour a = 0 et b < 0");

        // P6 Test avec a < 0 et b = 0 (c = 0)
        assertTrue(Calculatrice.multiplication(-4, 0) == 0, "test échoué pour a < 0 et b = 0");

        // P7 Test avec a = 0 et b = 0 (c = 0)
        assertTrue(Calculatrice.multiplication(0, 0) == 0, "test échoué pour a = 0 et b = 0");

        // P8 Test avec a < 0 et b > 0 (c = a * b < 0)
        assertTrue(Calculatrice.multiplication(-2, 3) == -6, "test échoué pour a < 0 et b > 0");

        // P9 Test avec a > 0 et b < 0 (c = a * b < 0)
        assertTrue(Calculatrice.multiplication(4, -2) == -8, "test échoué pour a > 0 et b < 0");

        System.out.println("Fin des tests pour la méthode multiplication");
    }

    @Test
    void division() {
        System.out.println("Début des tests pour la méthode division");

        // P1 Test avec a > 0 et b > 0 (c = a / b > 0)
        assertTrue(Calculatrice.division(6, 2) == 3, "test échoué pour a > 0 et b > 0");

        // P2 Test avec a = 0 et b > 0 (c = 0)
        assertTrue(Calculatrice.division(0, 4) == 0, "test échoué pour a = 0 et b > 0");

        // P3 Test avec a > 0 et b = 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(5, 0),
                "test échoué pour a > 0 et b = 0, exception attendue");

        // P4 Test avec a < 0 et b < 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(-6, -2),
                "test échoué pour a < 0 et b < 0, exception attendue");

        // P5 Test avec a = 0 et b < 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(0, -3),
                "test échoué pour a = 0 et b < 0, exception attendue");

        // P6 Test avec a < 0 et b = 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(-4, 0),
                "test échoué pour a < 0 et b = 0, exception attendue");

        // P7 Test avec a = 0 et b = 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(0, 0),
                "test échoué pour a = 0 et b = 0, exception attendue");

        // P8 Test avec a < 0 et b > 0 (c = a / b < 0)
        assertTrue(Calculatrice.division(-6, 3) == -2, "test échoué pour a < 0 et b > 0");

        // P9 Test avec a > 0 et b < 0 (c = erreur -> exception attendue)
        assertThrows(ArithmeticException.class,
                () -> Calculatrice.division(6, -2),
                "test échoué pour a > 0 et b < 0, exception attendue");

        System.out.println("Fin des tests pour la méthode division");
    }
}