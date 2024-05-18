%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int line_number = 1;
int token_id = 1; // Global variable to keep track of token IDs
FILE *output_file;
%}

%option noyywrap

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tKeyword\n", line_number, token_id++, yytext);
}

[0-9]+ {
    fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tConstant\n", line_number, token_id++, yytext);
}

[-+*/=<>!&|^%?:] {
    fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tOperator\n", line_number, token_id++, yytext);
}

"("     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
")"     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"{"     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"}"     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"["     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"]"     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
";"     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
","     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"."     { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"->"    { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"++"    { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }
"--"    { fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tSpecial Character\n", line_number, token_id++, yytext); }

[a-zA-Z_][a-zA-Z0-9_]* {
    fprintf(output_file, "\t%d\t|\t\t%d\t\t|\t%s\t\t|\tIdentifier\n", line_number, token_id++, yytext);
}

\n {
    line_number++;
}

[ \t] {
    // Ignore whitespace
}

. {
    // Ignore unrecognized characters
}

%%

int main() {
    FILE *input_file = fopen("input.txt", "r");
    output_file = fopen("output.txt", "w");

    if (input_file == NULL || output_file == NULL) {
        perror("Error");
        return 1;
    }

    fprintf(output_file, "Line number\t|\t\tToken ID\t|\tToken name\t|\tToken type\n");
    fprintf(output_file, "———————————————————————————————————————————————————————————————————————————————————————————————————\n");

    yyin = input_file;
    yylex();

    fclose(input_file);
    fclose(output_file);

    return 0;
}
