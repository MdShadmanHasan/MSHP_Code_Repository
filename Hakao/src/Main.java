import java.util.Scanner;

/**
 * Created by Md Shadman Hasan on 03-May-17.
 */
public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        User userinput = new User();
        String userinputs;

        do {

            System.out.print("Enter The Name Of The Student: ");
            userinputs = input.nextLine();
            userinput.setName();
        } while (userinputs.equals("EXIT"));
    }
}
