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

    public static int multiplication(int a, int b) {
        int result = 0;
        for (int i = 0; i < Math.abs(b); i++) {
            result = addition(result, a);
        }
        if (b < 0) {
            result = -result;
        }
        return result;
    }

    public static int division(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException("Division par zéro");
        }

        if (b<0){
            throw new ArithmeticException("Division par un nombre négatif");
        }

        int result = 0;
        int absA = Math.abs(a);
        int absB = Math.abs(b);
        while (absA >= absB) {
            absA = soustraction(absA, absB);
            result++;
        }
        if ((a < 0 && b > 0) || (a > 0 && b < 0)) {
            result = -result;
        }
        return result;
    }   
}
