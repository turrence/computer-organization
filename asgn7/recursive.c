/* 
Terence Tong
CSC 225 - 01
ASGN 7
*/
#include <stdio.h>
/**
 * This function counts backward from x to 1 by one.
 * For example, calling this function with a value of 5 should
 * result in the following output:
 * 5, 4, 3, 2, 1
 */
 void countBackwardFrom(int x){
	if (x == 1)
		printf("%d\n", x);
	else {
		printf("%d, ", x);
		countBackwardFrom(x-1);
	}	
 }
 
 /**
 * This function counts from one to x by one.
 * For example, calling this method with a value of 5 should
 * result in the following output:
 * 1, 2, 3, 4, 5
 */
 void countForwardTo(int x){
	if (x != 1){
		countForwardTo(x - 1);
	}
	if(x == 1){
		printf("1");
	} else
		printf(", %d", x);
 }
 
 int main(int argc, const char* argv[] ){
	while (1){
		int num1;
		printf("\nCount backwards and forwards from? ");
		scanf(" %d", &num1);
		printf("counting backwards...\n");
		countBackwardFrom(num1);
		printf("counting forwards...\n");
		countForwardTo(num1);
		printf("\n");
	}
	return 0;
 }
