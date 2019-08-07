/**a prorgamme to convert Roman
numerals to more familliar ones
the design is based on
MCDXCII from Alcock illustrating BASIC p102
by Darren Drapkin for Leeds Code Dojo

invocation romanToDecimal <number in roman numerals>

*/

import std.stdio;
int main(string[]args)
{

/*here's our decision table, Alcock calls it a symbol-state table
* I am declaring it immutable to speed processing and to stop accidentaly
* assigning to it during execuion
*/
immutable int[][][] decisionTable=
[
	//M	   D	   C	   L	  X	  V	I
	[[1000,2],[500,3],[100,9],[50,5],[10,10],[5,7],[1,11]],//state 01 -- the initial state
	[[1000,2],[500,3],[100,9],[50,5],[10,10],[5,7],[1,11]],//state 02
	[[0,-1],[0,-1],[100,9],[50,5],[10,10],[5,7],[1,11]],//state 03
	[[0,-1],[0,-1],[100,4],[50,5],[10,10],[5,7],[1,11]],//state 04
	[[0,-1,],[0,-1],[0,-1],[50,6],[10,10],[5,7],[1,11]],//state 05
	[[0,-1],[0,-1],[0,-1],[0,-1],[10,4],[5,7],[1,11]],//state 06
	[[0,-1],[0,-1],[0,-1],[0,-1],[0,-1],[5,8],[1,11]],//state 07
	[[0,-1],[0,-1],[0,-1],[0,-1],[0,-1],[0,-1],[1,8]],//state 08
	[[800,5],[300,5],[100,4],[50,6],[10,10],[5,8],[1,11]],//state 09
	[[0,-1],[0,-1],[80,7],[30,7],[10,6],[5,8],[1,11]],//state 10
	[[0,-1],[0,-1],[0,-1],[0,-1],[8,0],[3,0],[1,8]]//state 11
];

int state =1; // our initial state
int total =0;// our initial running total
"Your Roman number is :-".writeln;
args[1].writeln;
foreach(element;args[1])// read the Roman number, element by element, from the command line			{
			 {
			 if(state== -1)// have we reached an invalid state ?
			 	    {
				    " your number is invalid, try again....".writeln;
				    assert(0);// error return to calling environment
				    }
			if(toIndex(element)==-1)// have we input an ivalid digit
				{
				" your number has an invalid digit, try again...".writeln;
				assert (0);//error return to calling environment
				}
				
			total += decisionTable[state-1][toIndex(element)][0] ;//add new value to total
			state = decisionTable[state-1][toIndex(element)][1];//select the new state
			if(state ==0){ break;}// we have reached last state and therefore the final value
			}
			 "your decimal number is.....".writeln;
			 total.writeln;
			 writeln();
			 return 0;
 }//the end.....

int toIndex(char element)//convert roman numeral to index in symbol-state table
{
switch (element){
case'M':case'm':return 0;
case'D':case'd':return 1 ;
case'C':case'c':return 2 ;
case'L':case'l':return 3 ;
case'X':case'x':return 4 ;
case'V':case'v':return 5 ;
case'I':case'i':return 6 ;
default:"this digit is invalid".writeln; return -1; // rogue value error return
}}