package calculator;

public class Calculatrice {
    public static int addition(int a, int b) {
        if (b >= 0) {
            for (int i = 0; i < b; i++) {
                a++;
            }
        } else {
            for (int i = 0; i < Math.abs(b); i++) {
                a--;
            }
        }
        return a;
    }

    public static int soustraction(int a, int b) {
        if (b >= 0) {
            for (int i = 0; i < b; i++) {
                a--;
            }
        } else {
            for (int i = 0; i < Math.abs(b); i++) {
                a++;
            }
        }
        return a;
    }
}
