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

        //1 Test avec a et b positif 
        assertTrue(Calculatrice.addition(3, 2) == 5, "test échoué pour a et b positif");
        //2 Test avec a = 0 et b positif
        assertTrue(Calculatrice.addition(0, 2) == 2, "test échoué pour a = 0 et b positif");
        //3 Test avec a positif et b = 0
        assertTrue(Calculatrice.addition(3, 0) == 3, "test échoué pour a positif et b = 0");
        //4 Test avec a et b négatif
        assertTrue(Calculatrice.addition(-3, -2) == -5, "test échoué pour a et b négatif");
        //5 Test avec a = 0 et b négatif
        assertTrue(Calculatrice.addition(0, -2) == -2, "test échoué pour a = 0 et b négatif");

        System.out.println("Tous les tests sont terminés !");
    }
}