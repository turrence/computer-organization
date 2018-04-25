/*
Terence Tong
CSC 225 - 01
ASGN 6
*/
#include "stack.h"
#include <stdio.h>

int stack[10];
int stackPointer = 0;

/*
	return 1 if underflow
	else return popped
*/
int pop(int *value){
	if (stackPointer == 0){
		*value = 1;
		return 1;
	} else {
		int temp = stack[stackPointer-1];
		stack[stackPointer-1] = 0;
		stackPointer -= 1;
		*value = temp;
		return 0;
	}
}

/*
	return 0 for success
	return 1 for not success
*/
int push(int value){
	if (stackPointer == 10){
		return 1;
	}
	else {
		stack[stackPointer] = value;
		stackPointer = stackPointer + 1;
		return 0;
	}
}

void printStack(int num){
	int i;
	printf("Stack: ");
	switch(num){
		case 0: /*print in decimal*/
			for(i=0; i < stackPointer; i += 1){
				printf("%d ", stack[i]);
			}
		break;
		case 1: /*print in hex*/
			for(i = 0; i < stackPointer; i += 1){
				printf("%x ", stack[i]);
			}
		break;
		case 2: /*print in characters*/
			for(i = 0; i < stackPointer; i += 1){
				printf("%c ", stack[i]);
			}
		break;
		default:
		break;
	}
	printf("\n\n");
}
