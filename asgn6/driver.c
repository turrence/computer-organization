/*
Terence Tong
CSC 225 - 01
ASGN 6
*/
#include "stack.h"
#include <stdio.h>

int main(int argc, char *argv[]){
	int mode = 0;
	printf("Welcome to the stack program.\n\n");
	
	while (1){
		char letter;
		int num;
		int popped;
		printf("Enter option: ");
		scanf(" %c", &letter);
		switch(letter){
			case 'u':
				printf("What number? ");
				scanf("%d", &num);
				if (push(num) == 1){
					printf("Overflow!!!\n");
				}
			break;
			case 'o':
				if(pop(&popped) == 1){
					printf("Underflow!!!\n");
				} else {
					printf("Popped %d\n", popped);
				}
			break;
			case 'h':
				mode = 1;
			break;
			case 'c':
				mode = 2;
			break;
			case 'd':
				mode = 0;
			break;
			case 'x':
				printf("Goodbye!");
				return 0;
			break;
			default:
				printf("\n\n");
				continue;
				
			break;
		}
		printStack(mode);
	}
	return 0;
}
