	 .ORIG 	x3300

Q1        .STRINGZ  "\nWhat is your favorite food?\n   1 - Pizza\n   2 - Thai\n   3 - Sushi\n   4 - Firestone\n"
Q1Answ   .FILL    #2
         .FILL    #5
         .FILL    #10
         .FILL    #8

Q2    	 .STRINGZ  "\nWhat is your favorite TV show?\n   1 - Law & Order\n   2 - Scrubs\n   3 - Survivor\n   4 - Elimidate\n"
Q2Answ   .FILL    #8
         .FILL    #10
         .FILL    #5
         .FILL    #2

Q3    	 .STRINGZ  "\nWho is your favorite professor?\n   1 - Paul Hatalsky\n   2 - Professor from Gilligan's Island\n   3 - Nutty Professor\n   4 - Julie Workman\n"
Q3Answ   .FILL    #5
         .FILL    #8
         .FILL    #2
         .FILL    #10

Result1	.STRINGZ  "\nTerrible! You get an 'F'!"
Result2	.STRINGZ  "\nHmm, I thought your mother raised you better."
Result3	.STRINGZ  "\nNot bad, kid.  You have good taste."
Result4	.STRINGZ  "\nExcellent!  Julie, is that you???"

	.END