#include<iostream>
#include<stdio.h>
using namespace std;

struct Node {
    char data;
    int parent, lchild, rchild;
} nodes[101];

int n, lastchild[101];

void buildTree(){
  cin >> n;
  for (int i = 1; i <= n; i++)
	  cin >> nodes[i].data >> nodes[i].parent;
  for (int i = 2; i <= n; i++){
	int f = nodes[i].parent;
	if (lastchild[f] == 0)
		nodes[f].lchild = lastchild[f] = i;
	else{
		nodes[lastchild[f]].rchild=lastchild[f] = i;
		//Fill this part by yourself.  Think about it first.
	}
  }
}

void Preorder(Node &root){//先序遍历先输出根节点，再输出左子树和右子树 
cout<<root.data;
if (nodes[root.lchild].data!='\0') Preorder (nodes[root.lchild]);
if (nodes[root.rchild].data!='\0') Preorder (nodes[root.rchild]);
 //please finish the following parts.  It is easy. 
}
void Midorder(Node &root){ //中序遍历先输出左子树，再输出根节点，最后输出右子树 
if (nodes[root.lchild].data!='\0') Midorder (nodes[root.lchild]);
cout<<root.data;
if (nodes[root.rchild].data!='\0') Midorder (nodes[root.rchild]);
//please finish the following parts. It is easier. 
}

int main(){
  buildTree();
  Preorder(nodes[1]); cout<<"\n";
  Midorder(nodes[1]);
  //Fill this part by yourself.
  return 0;
}
