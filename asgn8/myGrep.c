/* Terence Tong
	ASGN 8
	http://users.csc.calpoly.edu/~jplanck/225/Assignments/Asgn8/asgn8.pdf
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>	
#include "myGrep.h"

/*create a pointer to this type of structure in the data type*/
struct wordNode{
	char word[100];
/* 	int totalOcc;
 */	int line;
	int index;
	char lineContent[100];	
	wordNode* next;
};

int main(int argc, char* argv[]){
	FILE *infile;
	wordNode* head = NULL;
	wordNode* tail = NULL;
	int number = 0;


	if(argc > 3 || argc < 3){
		printf("myGrep: improper number of arguments\nUsage: ./a.out <filename> <word>\n");
		return 0;
	}
	
	infile = fopen(argv[1], "r");

	if(infile){
		/* printf("Sick file\n"); */
		int lineCounter = 0;
		char longestLine[100];
		char line[100];
		char lineCopy[100];
		char *parsed;
		int i;
		for(i = 0; i < 3; i++)
			printf("%s ", argv[i]);
		printf("\n");
		while (fgets(line, 100, infile) != NULL){
			i = 0;
			if(strlen(line) > strlen(longestLine))
				strcpy(longestLine, line);
			strcpy(lineCopy, line);
			parsed = strtok(line, " \",().\n");
/* 			printf("parsed: %s\n", parsed);
 */			while(parsed){
				if(strcmp(parsed, argv[2]) == 0){
					wordNode* node = (wordNode*) malloc(sizeof(wordNode));
					number++;
					if (node == NULL){
						printf("no mems sorry bro");
						return 0;
					}
					strcpy(node->word, parsed);				/*creating node*/
					node->line = lineCounter;               /*creating node*/
					node->index = i;                        /*creating node*/
					strcpy(node->lineContent, lineCopy);    /*creating node*/
					node->next = NULL;                      /*creating node*/
					if (head == NULL){
						head = node;
						tail  = node;
					}
					else {
						tail -> next = node;
						tail = node;
					}
				}
				parsed = strtok(NULL, " \",().\n");
				i++;
			}
			lineCounter++;
		}
		printf("longest line: %s", longestLine); /* ends with new line */
		printf("num chars: %d\n", (int) strlen(longestLine));
		printf("num lines: %d\n", lineCounter);
		printf("total occurrences of word: %d\n", number);
		printNodeData(head);
		
	} else {
		printf("Unable to open file: %s\n", argv[1]);
		return 0;
	}
	fclose(infile);
	return 0;
}

void printNodeData(wordNode* headPtr){
	wordNode* current = headPtr;
	while(current != NULL){
		wordNode* temp = current;
		printf("line %d; word %d; %s", current->line, current->index, current->lineContent);
		current = current -> next;
		free(temp);
	}
}

