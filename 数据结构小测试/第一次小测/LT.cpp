#include <stdio.h>
#include <stdlib.h>

int m;  //������ 

struct node{
	int data;
	struct node *next;
};
node *head; // headָ��ͷ�ڵ� 

void insert(int i, int x){//����x��a[i] 
	node *p = head;
	while (i > 1){
		p = p->next; i--;
	} 
	node *q = (node*) malloc(sizeof(node));
	//add something here
	q->data=x;
	q->next=p->next;
	p->next=q;
} 

void find(int x){//���ҵ�һ��x 
	node *p = head->next; 
	int j = 1;
	//add something here
	while(p!=NULL&&p->data!=x)
	{
		p=p->next;
		j++;
	}
	if (p == NULL) j = 0;
	printf("%d\n", j);
}

void deleteByRange(int x, int y){ //ȥ��[x,y]��Χ�ڵ�Ԫ�� 
	node *p = head;
	node *q = head-> next;
	while (q != NULL){
		if (q->data >= x && q->data <= y){
			//add something here
			p->next=q->next;
			free(q);
			q=p->next;
		}
		else{
			//add something here
			p=q;q=p->next;
		}
	}
} 

int main() {
	scanf("%d", &m);
	head = (node*) malloc(sizeof(node));
	head->next = NULL;
	for (int k = 0; k < m; k++){
		int c, i, x, y;
		scanf("%d", &c);
		switch (c){
			case 1: scanf("%d%d", &i, &x); insert(i, x); break;
			case 2: scanf("%d", &x); find(x); break;
			case 3: scanf("%d%d", &x, &y); deleteByRange(x, y); break;
		}
	}
	return 0;
}

