class Violin {
  boolean isSolved = false;
  
  void display(){
    //draw the violin
    background(150);
    stroke(0);
    fill(169,120,89);
    rect(130,0,120,280);
    fill(60);
    rect(140,0,100,280);
    
    //pegs
    fill(39);
    rect(70,80,70,20);
    ellipse(60,90,40,40);
    rect(70,160,70,20);
    ellipse(60,170,40,40);
    rect(240,50,70,20);
    ellipse(320,60,40,40);
    rect(240,120,70,20);
    ellipse(320,130,40,40);
    
    //strings
    stroke(255);
    line(160,0,160,280);
    line(200,0,200,280);
    line(220,0,220,280);
    stroke(37,168,255);
    line(180,0,180,280);
    stroke(0);
    
    //tuning buttons
    fill(37,168,255);
    rect(140,300,100,80);
    fill(255,37,157);
    rect(280,300,100,80);
    line(160,340,220,340);
    line(300,340,360,340);
    line(330,310,330,370);
  }
}
