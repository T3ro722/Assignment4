//////////////////////////////////////////////////////////////////////////////////////
//////////Music Escape Room!! :)//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///Player's objective is to collect three numbers by solving puzzles!/////////////////
///But becareful! imputing the incorrect number will make you lose the game! >:D//////
///Good luck! :)//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


//Global Variables
//game states
boolean isPlaying = true;
boolean isLost = false;
boolean isWon = false;

//tracking puzzles
boolean pianoSolved = false;
boolean violinSolved = false;
int currentPuzzle = 0; //for tracking which puzzle is currently on. 0 = main room, 1 = piano, 2 = violin, 3 = portraits, 4 = door, 5 = window

//PImages
PImage room;
PImage cheat;
PImage doorImage;
PImage table;
PImage window;

// Puzzle objects
Door door;
Piano piano;
Violin violin;
Rain rain;

//declare Array
Rain [] rains = new Rain [10];//all the raindrops

void setup(){
  size(400,400);
  
  //load main room image
  room = loadImage("room.png");
  //load cheat sheet
  cheat = loadImage("cheat.png");
  //load portraits image
  table = loadImage("table.png");
  //load door image
  doorImage = loadImage("door.png");
  //load window image
  window = loadImage("window.png");
  
  //initialize new puzzles
  piano = new Piano();
  violin = new Violin();
  door = new Door();
  
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
   backButton();
 }else if (currentPuzzle == 2){
   violin.display();
   backButton();
 }else if (currentPuzzle == 3){
   portraits();
   backButton();
 }else if (currentPuzzle == 4){
   displayRain();
   backButton();
 }else if (currentPuzzle == 5){
   door.display();
   backButton();
 }
}

//defined functions
void mainRoom(){
  image(room,0,0,400,400);
}

//making portrait puzzle a user defined function since I decided to make it no longer interactive
void portraits(){
  background(255);
  image(table,0,0,400,400); //display image
}
  
//the back button
void backButton(){
  //conditional statement to ensure back button is only displaying in puzzles (Window, piano, vioiin, portrait, door, not in main room)
  if (currentPuzzle == 1 || currentPuzzle == 2 || currentPuzzle == 3 || currentPuzzle == 4 || currentPuzzle == 5){
  fill(255,0,0);//bright red
  rect(20,360,60,20);
  fill(0);
  textSize(15);
  textAlign(CENTER,CENTER);//locate the text accurately
  text("BACK",50,370);
  }
}

//display rain
void displayRain(){
  
  //window
  image (window,0,0,400,400);
  
  // loop
  for (int i = 0; i<rains.length;i++){
    rains[i].update(); //update each raindrop's position
    rains[i].display();//display each raindrop
  }
}

void mousePressed(){
  if (currentPuzzle == 0){ //piano entry
    if(mouseX > 220 && mouseX < 360 && mouseY > 160 && mouseY < 260){
      currentPuzzle = 1;
    }
  }
  if (currentPuzzle == 0){ //violin entry
  if (mouseX > 320 && mouseX<380 && mouseY>260 && mouseY<380){
    currentPuzzle = 2;
  }
}
  if (currentPuzzle == 0){ //portrait entry
  if (mouseX > 0 && mouseX < 110 && mouseY > 120 && mouseY < 280){
    currentPuzzle = 3;
  }
}
  if (currentPuzzle == 0){ //window entry
  if (mouseX > 210 && mouseX < 260 && mouseY > 80 && mouseY < 150){
    currentPuzzle = 4;
  }
}
  
  if (currentPuzzle > 0){ //back button entry
    if(mouseX > 20 && mouseX < 80 && mouseY > 360 && mouseY < 380){
      currentPuzzle = 0; //bring to main room
    }
  }
}
  
  
