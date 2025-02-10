#include <stdio.h>
#include <stdlib.h>
typedef struct BiTNode {
    int data;
    struct BiTNode *lchild, *rchild;
} BiTNode, *BiTree;
void CreateBiTree(BiTree &T){
    char ch;
    scanf("%c", &ch);
    if('#' == ch) T = NULL;
    else{
        if(!(T = (BiTNode *)malloc(sizeof(BiTNode)))) exit(-1);
        //fill this part. 
        T->data=ch;
        CreateBiTree(T->rchild);
        CreateBiTree(T->lchild);
		//Hint: what should be T->ch?  
		//Hint: recursively build T->lchild and T->rchild
    }
}
int count(BiTree T){
    if(T == NULL) return 0;
    else if(T->lchild!=NULL&&T->rchild==NULL){
    	return count(T->lchild)+1;
	}
	else if(T->lchild==NULL&&T->rchild!=NULL){
    	return count(T->rchild)+1;
	}
	else return count(T->rchild)+count(T->lchild);
    //fill this part. This part is really easy.
}

int main(){
    BiTree T;
    CreateBiTree(T);
    printf("%d", count(T));
    return 0;
}
