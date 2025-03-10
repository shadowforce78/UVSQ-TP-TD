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
    }
}