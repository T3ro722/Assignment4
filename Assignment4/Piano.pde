class Piano {
  boolean isSolved = false; //isSolved to track what it will display when player clicks in, if incomplete, it will display puzzles, if already completed, then the clue and a back button
  
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
  }
}
    
