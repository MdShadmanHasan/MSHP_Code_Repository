//program for AND gate using two input variables and
//threshold value and show particular output pattern for particular input pattern

#include<stdlib.h>
#include<time.h>
#include<stdio.h>
#include<math.h>

int main()
{
    int i,j,numIn=4,bias=-1,input[4][2]={{0,0},{0,1},{1,0},{1,1}},desired_out[4]={0,0,0,1},t1,t2;

    float weights[3][1],coeff=0.7,y,delta,out[4],sum;

    srand(time(NULL));
    for(i=0; i<3; i++)
    {
        weights[i][0]=rand();
     weights[i][0]=weights[i][0]/(weights[i][0]+rand());
    }
do
    {
        sum=0.0;
        for(j=0;j<numIn;j++){
        y=bias*weights[0][0]+input[j][0]*weights[1][0]+input[j][1]*weights[2][0];

        out[j]=1/(1+exp(-y));     //sigmoid function

        delta=desired_out[j]-out[j]; //delta rules
        sum=sum+delta*delta;
        weights[0][0]= weights[0][0]+coeff*bias*delta;
        weights[1][0]= weights[1][0]+coeff*input[j][0]*delta;
        weights[2][0]= weights[2][0]+coeff*input[j][1]*delta;
    }
    sum=sqrtf(sum);
}while (sum>0.001);
printf("Output:.........\n");
for(i=0;i<4;i++)
    printf("%f\n",out[i]);
printf("\nweights......\n");
for(i=0;i<3;i++)
    printf("%f\n",weights[i][0]);

    printf("\nEnter your pattern:");
    scanf("%d%d",&t1,&t2);
    for(i=0;i<4;i++)
    {
        if(input[i][0]==t1&&input[i][1]==t2)
            break;
    }
    printf("Your output:%f",out[i]);
    return 0;
}
