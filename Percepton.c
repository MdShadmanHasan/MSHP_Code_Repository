#include<stdlib.h>
#include<time.h>
#include<stdio.h>

int main()
{
    int i,j,numIn=4,iterations,bias=-1,input[4][2]={{0,0},{0,1},{1,0},{1,1}},desired_out[4]={0,1,1,1};

     float weights[3][1], coeff=0.7, y, delta, out[4];

    srand(time(NULL)); //time related random value
    printf("Initial random weights:\n");
    for(i=0; i<3; i++)
    {
        weights[i][0]=rand();
        weights[i][0]=weights[i][0]/(weights[i][0]+rand());
        printf("%f\n", weights[i][0]);  //initial weights
    }
    printf("Enter No of iteration:");
    scanf("%d",&iterations);
    for(i=1;i<=iterations;i++)
    {

        for(j=0;j<numIn;j++)
        {
            y=bias*weights[0][0]+input[j][0]*weights[1][0]+input[j][1]*weights[2][0];

            out[j]=1/(1+exp(-y));       //sigmoid function

            delta=desired_out[j]-out[j];     //delta rules

        weights[0][0]= weights[0][0]+coeff*bias*delta;

        weights[1][0]= weights[1][0]+coeff*input[j][0]*delta;

        weights[2][0]= weights[2][0]+coeff*input[j][1]*delta;
    }
    }

printf("Output:.........\n");
for(i=0;i<4;i++)
    printf("%f\n",out[i]);

printf("\nweights......\n");
for(i=0;i<3;i++)
    printf("%f\n",weights[i][0]);
    return 0;
}
