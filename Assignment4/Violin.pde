class Violin {
  boolean isSolved = false;
  int currentNoteIndex = 3; //current note played
  String[] notes = {"D", "E", "Eb", "F", "Fs", "G"}; // List of notes
  
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
      textSize(50);
      text("9",width/2,height/2);
  }
}

void whenMousePressed(int mouseX, int mouseY, SoundFile[] noteSounds) {
    if (!isSolved) {
      if (mouseX > 140 && mouseX < 240 && mouseY > 300 && mouseY < 380) { // Minus button
        changeNote(-1, noteSounds); // Decrease note
      } else if (mouseX > 280 && mouseX < 380 && mouseY > 300 && mouseY < 380) { // Plus button
        changeNote(1, noteSounds); // Increase note
      } else { // Clicked anywhere else in the puzzle
        playCurrentNote(noteSounds);
      }
    }
  }

  void changeNote(int direction, SoundFile[] noteSounds) {
    // Update the note index
    currentNoteIndex = constrain(currentNoteIndex + direction, 0, notes.length - 1);

    // Play the updated note
    playCurrentNote(noteSounds);

    // Check if the puzzle is solved
    if (notes[currentNoteIndex].equals("D")) {
      isSolved = true;
    }
  }

  void playCurrentNote(SoundFile[] noteSounds) {
    // Stop all notes
    for (int i = 0; i < noteSounds.length; i++) {
      if (noteSounds[i].isPlaying()) {
        noteSounds[i].stop();
      }
    }

    // Play the current note
    noteSounds[currentNoteIndex].play();
  }
}
