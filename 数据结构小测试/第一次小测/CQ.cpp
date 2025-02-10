#include<stdio.h>
const int max=21;
int main()
{
	int m,n;
	scanf("%d %d",&m,&n);
	char b=getchar();
	char s[5],c[max];
	int i=0,front=0,rear=0;
	while(i<n)
	{
		gets(s);
		if(s[0]=='1')
		{
			c[rear]=s[2];
			rear=(rear+1)%m;
		}
		else
		{
			front=(front+1)%m;
		}
		printf("%d %d\n",front,rear);
		i++;
	}
	while(front!=rear)
	{
		printf("%c",c[front]);
		front=(front+1)%m;
	}
 } 
