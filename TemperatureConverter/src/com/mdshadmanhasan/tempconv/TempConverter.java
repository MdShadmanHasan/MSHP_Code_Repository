package com.mdshadmanhasan.tempconv;

import java.util.Scanner;

/**
 * Created by Md Shadman Hasan on 12-Apr-17.
 */
public class TempConverter {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String choice;

        do {
            System.out.println("Enter Which Type Of Conversion Do You Want To Do: ");
            System.out.println("1: Celsius to Farenhite");
            System.out.println("2: Farenhite to Celsius");
            System.out.println("Press q to Quit");
            choice = input.nextLine();
            //System.out.println(choice);

            if (choice.equals("1")){
                System.out.printf("Input Temperature in Celsius: ");
                double celsius = input.nextDouble();

                double farenhite = (9*celsius+160)/5;

                System.out.println("Temperature in Farenhite is " + farenhite + " Degree Farenhite");
            } else if (choice.equals("2")) {
                System.out.printf("Input Temperature in Farenhite: ");
                double farenhite = input.nextDouble();

                double celsius = (5*farenhite-160)/9;

                System.out.println("Temperature in Celsius is " + celsius + " Degree Celsius");
            }

        } while(!choice.equals("q"));
    }
}
