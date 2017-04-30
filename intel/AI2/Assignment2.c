#include<stdlib.h>
#include<time.h>
#include<stdio.h>
#include<math.h>

int main()
{
    int i,j,numIn=4,bias=-1,input[4][2]={{0,0},{0,1},{1,0},{1,1}},desired_out[4]={0,1,1,1},t1,t2;

     float weights[3][1],coeff=0.7,y,delta,out[4],root[4]={0},sum=1;
    //srand(time(NULL));
    for(i=0; i<3; i++){
        weights[i][0]=rand();
     weights[i][0]=-1*weights[i][0]/(weights[i][0]+rand());
    //printf("%f\n", weights[i][0]);
    }
    //printf("Enter No of iteration:");
    //scanf("%d",&iterations);
  while(sum>0.001)
    {
        sum=0.0;
        for(j=0;j<4;j++)
        {
            out[j]=0;
            root[j]=0;
        }

        for(j=0;j<4;j++){
            y=bias*weights[0][0]+input[j][0]*weights[1][0]+input[j][1]*weights[2][0];
        out[j]=1/(1+exp(-y));

        delta=desired_out[j]-out[j];
        root[j]=delta*delta;
        sum=sum+root[j];
        weights[0][0]= weights[0][0]+coeff*bias*delta;
        weights[1][0]= weights[1][0]+coeff*input[j][0]*delta;
        weights[2][0]= weights[2][0]+coeff*input[j][1]*delta;
    }
    sum=sqrtf(sum);
}
printf("Output:.........\n");
for(i=0;i<4;i++)
    printf("%f\n",out[i]);
printf("\nweights......\n");
for(i=0;i<3;i++)
    printf("%f\n",weights[i][0]);

    printf("Enter your pattern:");
    scanf("%d%d",&t1,&t2);
    for(i=0;i<4;i++)
    {
        if(input[i][0]==t1&&input[i][1]==t2)
            break;
    }
    printf("\nYour output:%f",out[i]);
    return 0;
}
