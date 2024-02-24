import java.util.Arrays;

public class Test {
    public static void main(String[] args) {

        int max = 3;
        int min = 1;

        float[][] hexarray = new float[5][5];

        for (int r = 0; r < 5; r++) {
            for (int c = 0; c < 5; c++) {
                int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
                if (r == 3) {
                    if (c != 3 && c != 4) {
                        hexarray[r][c] = random_int;
                    }
                } else if (r == 4) {
                    if (c == 0) {
                        hexarray[r][c] = random_int;
                    }
                } else {
                    hexarray[r][c] = random_int;
                }
            }
        }

        for (int r = 0; r < 5; r++) {
            for (int c = 0; c < 5; c++) {
                System.out.print(hexarray[r][c] + " ");
            }
            System.out.println();
        }
    }
}