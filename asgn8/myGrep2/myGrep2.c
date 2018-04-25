/* Terence Tong
	ASGN 8 EC
	http://users.csc.calpoly.edu/~jplanck/225/Assignments/Asgn8/asgn8.pdf
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>	
#include "myGrep2.h"

/*create a pointer to this type of structure in the data type*/
struct wordNode{
	char word[100];
/* 	int totalOcc;
 */	int line;
	int index;
	char lineContent[100];	
	wordNode* next;
	wordNode* subNode;
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
		wordNode* subTail = tail;
		int i;
		for(i = 0; i < 3; i++)
			printf("%s ", argv[i]);
		printf("\n");
		while (fgets(line, 100, infile) != NULL){
			subTail = tail;
			i = 0;
			if(strlen(line) > strlen(longestLine))
				strcpy(longestLine, line);
			strcpy(lineCopy, line);
			parsed = strtok(line, " \",().\n");
/* 			printf("parsed: %s\n", parsed);
 */			while(parsed){ /* for each word in line*/
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
					node->next = NULL;       					/*creating node*/
					node -> subNode = NULL;
					if (head == NULL){
						head = node;
						tail  = node;
						subTail = node;
					} else if(tail -> line == lineCounter){
						subTail -> subNode  = node;
						subTail = node;
					} else {
						tail -> next = node;
						tail = node;
						subTail = tail;
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
		printLinkedList(head);
		
	} else {
		printf("Unable to open file: %s\n", argv[1]);
		return 0;
	}
	fclose(infile);
	return 0;
}

void printLinkedList(wordNode* headPtr){
	wordNode* current = headPtr;
	while(current != NULL){
		wordNode* temp = current;
		printf("line %d; word %d; %s", current->line, current->index, current->lineContent);
		if(current -> subNode != NULL){
			wordNode* subTemp1 = current -> subNode;
			printf("Same line as above, word(s): ");
			while(subTemp1 != NULL){
				wordNode* subTemp2 = subTemp1;
				printf(" %d", subTemp1 -> index);
				subTemp1 = subTemp1 -> subNode;
				free(subTemp2);
				if(subTemp1 != NULL)
					printf(",");
			}
			printf("\n");
		}
		current = current -> next;
		free(temp);
	}
}

