//////////////////////////////////////////////////////////////////////////////////////
//////////Music Escape Room!! :)//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
///Player's objective is to collect three numbers by solving puzzles!/////////////////
///But becareful! imputing the incorrect number will make you lose the game! >:D//////
///Good luck! :)//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/////reference used: https://processing.org/reference/libraries/sound/index.html//////
/////https://processing.org/reference/String.html/////////////////////////////////////
////https://processing.org/reference/return.html#:~:text=Functions%20declared%20with%20void%20can,program%20to%20the%20remaining%20statements.////

import processing.sound.*;

//Global Variables

//Sound files
SoundFile[]noteSounds; //array for storing notes
String[] notes = {"D", "Eb", "E", "F", "Fs", "G"};

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
  
  //load sound Files
  noteSounds = new SoundFile[notes.length];
  noteSounds[0] = new SoundFile(this, "D.wav");
  noteSounds[1] = new SoundFile(this, "Eb.wav");
  noteSounds[2] = new SoundFile(this, "E.wav");
  noteSounds[3] = new SoundFile(this, "F.wav");
  noteSounds[4] = new SoundFile(this, "Fs.wav");
  noteSounds[5] = new SoundFile(this, "G.wav");
  
   //initialize new puzzles
  piano = new Piano();
  violin = new Violin(noteSounds);
  door = new Door();
  
  //loop for rain array//
  for (int i = 0; i< rains.length; i++){
    rains[i] = new Rain();
  }
 
}

void draw(){
  background(255);
  
  println("isWon: " + isWon + ", isLost: " + isLost);
   if (isWon || isLost) {
    displayEndingScreen();
  } else {
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
}

//defined functions
void displayEndingScreen() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(30);

  if (isWon) {
    fill(236,128,188); // bright and pink
    text("Congratulations!", width / 2, height / 2 - 50);
    text("You are a true Lingling :D", width / 2, height / 2);
  } else if (isLost) {
    fill(200, 0, 0); // Red for failure
    text("Game Over!", width / 2, height / 2 - 50);
    text("Try Again?", width / 2, height / 2);
  }

  // Reset button
  fill(236, 128, 188); // Pink for the reset button
  rect(100, 310, 200, 50);
  fill(0);
  textSize(20);
  text("Play Again", width / 2, 335);
}

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

void resetGame() {
  println("Resetting game...");
  isWon = false;
  isLost = false;
  currentPuzzle = 0;

  // Reset puzzles
  piano = new Piano();
  violin = new Violin(noteSounds);
  door = new Door();
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

void mousePressed() {
  if (isWon || isLost) {
    // Reset button interaction
    if (mouseX > 100 && mouseX < 300 && mouseY > 310 && mouseY < 360) {
      println("Reset button clicked");
      resetGame();
    }
  } else {
  if (currentPuzzle == 1){ //piano interaction
  piano.whenMousePressed(mouseX,mouseY);
  }
  if (currentPuzzle == 2) { // Violin puzzle interactions
    violin.whenMousePressed(mouseX,mouseY); // Pass only the noteSounds array
  }
  if (currentPuzzle == 5) { // Door puzzle
    println("Mouse interaction routed to Door puzzle");
    door.display();
    door.whenMousePressed(mouseX, mouseY);
  }
  if (currentPuzzle == 5 && (isLost || isWon)){
    displayEndingScreen();
  }
  // Reset button interaction (for game over screen)
  if ((isLost || isWon) && mouseX > 100 && mouseX < 280 && mouseY > 310 && mouseY < 360) {
    println("Reset button clicked");
    resetGame();
  }

  // Back button interaction
  if (currentPuzzle > 0 && mouseX > 20 && mouseX < 80 && mouseY > 360 && mouseY < 380) {
    println("Back button clicked");
    currentPuzzle = 0; // Return to main room
  }
  if (currentPuzzle == 0) { // Main room interactions
    if (mouseX > 220 && mouseX < 360 && mouseY > 160 && mouseY < 260) {
      currentPuzzle = 1; // Piano
    } else if (mouseX > 320 && mouseX < 380 && mouseY > 260 && mouseY < 380) {
      currentPuzzle = 2; // Violin
    } else if (mouseX > 0 && mouseX < 110 && mouseY > 120 && mouseY < 280) {
      currentPuzzle = 3; // Portraits
    } else if (mouseX > 210 && mouseX < 260 && mouseY > 80 && mouseY < 150) {
      currentPuzzle = 4; // Window
    } else if (mouseX > 130 && mouseX < 190 && mouseY > 130 && mouseY < 240){
      currentPuzzle = 5; //door
  }
  }

  // Back button interaction
  if (currentPuzzle > 0 && mouseX > 20 && mouseX < 80 && mouseY > 360 && mouseY < 380) {
    currentPuzzle = 0; // Return to main room
  }
}
}

  
  
