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
        assertTrue(Calculatrice.addition(-3, 2) == -1, "test échoué pour a négatif et b positif");
        assertEquals(Calculatrice.addition(3, -2), 1, "test échoué pour a positif et b négatif");
    }
}