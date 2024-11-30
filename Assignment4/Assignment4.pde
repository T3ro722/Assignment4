//////////////////////////////////////////////////
//////////Music Escape Room!! :)//////////////////
//////////////////////////////////////////////////
///Player's objective is to collect three numbers by solving puzzles!////////
///But becareful! imputing the incorrect number will make you lose the game! >:D//////
///Good luck! :)//////////////////////////////////////
//////////////////////////////////////////////////////


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

//PImages
PImage room;

//declare Array
Rain [] rains = new Rain [70];//all the raindrops

void setup(){
  size(400,400);
  //load main room image
  room = loadImage("room.png");
  
  //loop for rain array//
  for (int i = 0; i< rains.length; i++){
    rains[i] = new Rain();
  }
}

void draw(){
  background(255);
  
  //game state management//
 if (currentPuzzle == 0){
   mainRoom();
 }else if (currentPuzzle == 1){
   piano.display();
 }else if (currentPuzzle == 2){
   violin.display();
 }else if (currentPuzzle == 3){
   quiz.display();
 }
}

//defined functions
void mainRoom(){
  image(room,0,0,400,400);
}
  
