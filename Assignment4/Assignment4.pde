//////////////////////////////////////////////////
//////////Music Escape Room!! :)//////////////////
//////////////////////////////////////////////////
///Player's objective is to collect three numbers by solving puzzles!////////
///But becareful! imputing the incorrect number will make you lose the game! >:D//////
///Good luck! :)//////////////////////////////////////
//////////////////////////////////////////////////////


//declare Array
Rain [] rains = new Rain [70];//all the raindrops

//Global Variables
//game states
boolean isPlaying = true;
boolean isLost = false;
boolean isWon = false;
//tracking puzzles
boolean pianoSolved = false;
boolean violinSolved = false;
boolean portraitSolved = false;
int currentPuzzle = 0; //for tracking which puzzle is currently on. 0 = main room, 1 = piano, 2 = violin, 3 = portraits, 4 = door, 5 = window



void setup(){
  size(400,400);
