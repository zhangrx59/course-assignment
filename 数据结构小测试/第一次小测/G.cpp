#include <stdio.h>
#include <stdlib.h>
void graycode(int n, int a[]){ 
// ���
    if(n==1)
	{
		a[0]=0;a[1]=1;
	 } 
	else
	{
		graycode(n-1,a);
		int i=0,m=1<<n,s=m-1;
		while(i<(m/2))
		{
			a[s]=a[i]+(m/2);
			s--;
			i++;
		}
	}
}
//��Ϊ�ǿ������� 
void display(int n,int G[]){
	int m = 1<<n; 
	int s =0 ;
	int remainder[200] ;
	int k = 0;	
	int a,b,i,j;
	for( s ; s < m; ++s){
		k = 0 ;
		a = G[s];
	
		while(a != 0) 
		{
			b=a/2;
       		k++;
        	remainder[k]=a-b*2;
        	a=a/2;	
		}
		// k����ת��Ϊ�����Ƶ�λ������λ��С��Ҫ���λ��nʱ����ǰ�油0 
		for(j = k; j < n ; j++ ) printf("0");
		//����ö������� 
		for(i=k; i>=1; i--)
		{	
			printf("%d",remainder[i]);
		}
		printf("\n"); 				
	}
}
int main(int argc, char *argv[]) {
	int k ;
	scanf("%d", &k); getchar();	
	int m = 1 <<k ;
	int *a ;
	a=(int *)calloc(m,sizeof(int)); 
	graycode(k,a);
	display(k,a);
	free(a);
	return 0;
}
