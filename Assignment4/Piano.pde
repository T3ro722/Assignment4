class Piano {
  boolean isSolved = false; //isSolved to track what it will display when player clicks in, if incomplete, it will display puzzles, if already completed, then the clue and a back button
  int currentStep = 0; //tracks which key you clicked
  
  void display(){
    //draw the piano
    background(150);
    stroke(0);
    fill(255);
    rect(0,200,400,140);
    line(40,200,40,340);  //all the piano white tiles
    line(100,200,100,340);
    line(160,200,160,340);
    line(220,200,220,340);
    line(280,200,280,340);
    line(340,200,340,340);
    
    fill(0);//black keys
    rect(20,200,40,80);
    rect(80,200,40,80);
    rect(200,200,40,80);
    rect(260,200,40,80);
    rect(380,200,40,80);
    
    //notes
    textSize(40);
    text("D Eb C B",80,20);
    
    //cheetsheet
    image(cheat,160,10,230,150);
    
    //sucess message after solved
    if(isSolved){
      fill(255,0,0);
      textSize(100);
      text("0",width/2,height/2);
  }
}

 void whenMousePressed(int mouseX, int mouseY) {
    if (!isSolved) {
      // Check which key was clicked in sequence
      if (currentStep == 0 && mouseX > 220 && mouseX < 280 && mouseY > 200 && mouseY < 340) {
        currentStep++; // D key
      } else if (currentStep == 1 && mouseX > 260 && mouseX < 300 && mouseY > 200 && mouseY < 280) {
        currentStep++; // Eb key
      } else if (currentStep == 2 && mouseX > 160 && mouseX < 220 && mouseY > 200 && mouseY < 340) {
        currentStep++; // C key
      } else if (currentStep == 3 && mouseX > 100 && mouseX < 160 && mouseY > 200 && mouseY < 340) {
        isSolved = true; // B key
      }
    }
  }
}


    
    
