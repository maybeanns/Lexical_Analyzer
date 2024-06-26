# Lexical_Analyzer
Lexical Analyzer for C++ made in C.. The primary objective is to construct a sophisticated program capable of recognizing and categorizing diverse token types within a given input text.
## 1. Flex File (project.l): 
The Flex file serves as the cornerstone of the lexical analyzer, encapsulating the lexical rules expressed in 
the form of regular expressions

## 2. Main C++ Program (main.cpp): 
The main C++ program serves as the entry point for the lexical analyzer, orchestrating the interaction 
with the Flex-generated lexer.  The main program integrates with the lexer generated by Flex, invoking the 
lexer functions to tokenize the provided input text. It calls the `yylex()` function to initiate the lexical 
analysis process, which sequentially scans the input text and identifies tokens based on the defined 
regular expressions. 

## Future Directions
Integration with Parser: Integrating the lexical analyzer with a parser to build a complete compiler 
front end capable of parsing and analyzing complex source code

### Peace!
