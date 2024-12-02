class Violin {
  SoundFile[] noteSounds; // Array for notes
  String[] notes = {"D", "Eb", "E", "F", "Fs", "G"};
  int currentNoteIndex = 3; // Start with "F"
  boolean isSolved = false;
  boolean hasPlayedInitialNote = false; // Tracks if the initial note was played
 

 Violin(SoundFile[] noteSounds) {
    this.noteSounds = noteSounds; // Store the noteSounds array
  }

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
    fill(37,168,255); //minus button
    rect(140,300,100,80);
    fill(255,37,157); //plus button
    rect(280,300,100,80);
    line(160,340,220,340);
    line(300,340,360,340);
    line(330,310,330,370);
    
    //success message if solved
    if (isSolved) {
      fill(255,0,0);
      textSize(100);
      text("9",width/2,height/2);
  }
  // Play the initial note when first entering the puzzle
    if (!hasPlayedInitialNote) {
      playCurrentNote();
      hasPlayedInitialNote = true; // Ensure the note is only played once
    }
}

  void whenMousePressed(int mouseX, int mouseY) {
    if (!isSolved) {
      if (mouseX > 140 && mouseX < 240 && mouseY > 300 && mouseY < 380) { // Minus button
        println("Minus button clicked");
        changeNote(-1);
      } else if (mouseX > 280 && mouseX < 380 && mouseY > 300 && mouseY < 380) { // Plus button
        println("Plus button clicked");
        changeNote(1);
      }
    }
  }

  void changeNote(int direction) {
    currentNoteIndex = constrain(currentNoteIndex + direction, 0, notes.length - 1);
    println("Current Note Index: " + currentNoteIndex);
    playCurrentNote();

    if (notes[currentNoteIndex].equals("D")) {
      isSolved = true;
      println("Violin Solved!");
    }
  }

  void playCurrentNote() {
    for (int i = 0; i < noteSounds.length; i++) {
      if (noteSounds[i].isPlaying()) {
        noteSounds[i].stop();
      }
    }
    noteSounds[currentNoteIndex].play();
    println("Playing Note: " + notes[currentNoteIndex]);
  }
}
