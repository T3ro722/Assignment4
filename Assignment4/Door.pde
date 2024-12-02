class Door {
  int currentStep = 0; // Tracks the current number in the sequence (0 for 4, 1 for 0, 2 for 9)

  void display() {
    image(doorImage, 0, 0, 400, 400);
  }

  void whenMousePressed(int mouseX, int mouseY) {
    if (isWon || isLost) {
      println("Puzzle already solved or failed, ignoring clicks.");
      return; // Ignore clicks if the game is already over
    }

    // Check button clicks
    if (currentStep == 0 && mouseX > 130 && mouseX < 160 && mouseY > 210 && mouseY < 240) {
      println("4 clicked, step 1 passed.");
      currentStep++; // Correct first number: 4
    } else if (currentStep == 1 && mouseX > 170 && mouseX < 200 && mouseY > 300 && mouseY < 330) {
      println("0 clicked, step 2 passed.");
      currentStep++; // Correct second number: 0
    } else if (currentStep == 2 && mouseX > 210 && mouseX < 240 && mouseY > 250 && mouseY < 290) {
      println("9 clicked, puzzle solved!");
      isWon = true; // Correct third number: 9
      println("Global isWon updated to true.");
    } else {
      println("Incorrect number or out of sequence. Puzzle failed.");
      isLost = true; // Any incorrect click results in failure
    }
  }
}
