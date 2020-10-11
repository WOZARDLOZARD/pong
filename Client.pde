class Client {
  void restart() {
    if (practice) {
      if (inverseControls) {
        setup();
        inverseControls = true;
        practice = true;
        chooseMode = false;

        return;
      }

      setup();
      practice = true;
      chooseMode = false;

      return;
    }

    if (portalMode) {
      if (inverseControls) {
        setup();
        inverseControls = true;
        portalMode = true;
        chooseMode = false;

        return;
      }

      setup();
      portalMode = true;
      chooseMode = false;

      return;
    }

    if (inverseControls) {
      setup();
      inverseControls = true;
      chooseMode = false;

      if (difficulty == 1) playerHeight = 100;

      return;
    }

    setup();
    chooseMode = false;

    if (difficulty == 1) playerHeight = 100;
  }

  void restartAll() {
    setup();

    p1Name = "";
    p2Name = "";
  }

  void pause() {
    if (!paused) {
      fill(255);
      noStroke();
      textAlign(CENTER);
      textSize(26);
      text("Paused", width / 2, height / 2 + 30);

      rect(width / 2 - 15, height / 2 - 40, 10, 32);
      rect(width / 2 + 5, height / 2 - 40, 10, 32);

      paused = true;

      noLoop();
    } else {
      loop();
      paused = false;
    }
  }

  void openGame() {
    fill(255, 255, 255, textOpacity);
    noStroke();

    textSize(16);
    textAlign(LEFT);
    text(currentVersion, 20, 30);

    textAlign(CENTER);
    textSize(40);
    text("Jeremy Liu", width / 2 - 40, height / 2 - 26);

    textSize(26);
    text("A", width / 2 - 170, height / 2 - 26);
    text("Production", width / 2 + 150, height / 2 - 26);

    text("Powered by Processing", width / 2, height / 2 + 26);

    if (textOpacity > 0 && textOpacity <= 255) {
      textOpacity += textOpacityChange;
    }

    if (textOpacity >= 255) textOpacityChange = -1;

    if (textOpacity == 0) {
      startScreen = false;

      chooseMode = true;
    }
  }

  void changeCursor() {
    if (chooseMode && !chooseGame) {
      if (mouseX >= 325 && mouseX <= 380 && mouseY >= 330 && mouseY <= 350) {
        cursor(HAND);
        
        fill(255);
        noStroke();
        beginShape();
        vertex(300, 330);
        vertex(310, 340);
        vertex(300, 350);
        endShape();
        beginShape();
        vertex(400, 330);
        vertex(390, 340);
        vertex(400, 350);
        endShape();
      } else if (mouseX >= 310 && mouseX <= 390 && mouseY >= 370 && mouseY <= 390) {
        cursor(HAND);
        
        fill(255);
        noStroke();
        beginShape();
        vertex(290, 370);
        vertex(300, 380);
        vertex(290, 390);
        endShape();
        beginShape();
        vertex(410, 370);
        vertex(400, 380);
        vertex(410, 390);
        endShape();
      } else if (mouseX >= 260 && mouseX <= 320 && mouseY >= 520 && mouseY <= 530) {
        if (currentPage != 1) {
          cursor(HAND);
        } else cursor(ARROW);
      } else if (mouseX >= 380 && mouseX <= 440 && mouseY >= 520 && mouseY <= 530) {
        if (currentPage != 8) {
          cursor(HAND);
        } else cursor(ARROW);
      } else if (mouseX >= 10 && mouseX <= 60 && mouseY >= 90 && mouseY <= 102) {
        cursor(HAND);
      } else cursor(ARROW);
    } else if (chooseMode && chooseGame) {
      if (battleMode) {
        if (mouseX >= 270 && mouseX <= 430 && mouseY >= 200 && mouseY <= 220) {
          cursor(HAND);
        } else if (mouseX >= 270 && mouseX <= 430 && mouseY >= 240 && mouseY <= 260) {
          cursor(HAND);
        } else if (mouseX >= 275 && mouseX <= 420 && mouseY >= 280 && mouseY <= 300) { 
          cursor(HAND);
        } else cursor(ARROW);
      }
      
      if (otherMode) {
        if (mouseX >= 270 && mouseX <= 430 && mouseY >= 200 && mouseY <= 220) { 
          cursor(HAND);
        } else if (mouseX >= 280 && mouseX <= 420 && mouseY >= 240 && mouseY <= 260) { 
          cursor(HAND);
        } else if (mouseX >= 250 && mouseX <= 450 && mouseY >= 280 && mouseY <= 300) {
          cursor(HAND);
        } else if (mouseX >= 290 && mouseX <= 405 && mouseY >= 320 && mouseY <= 340) {
          cursor(HAND);
        } else cursor(ARROW);
      }
    } else cursor(ARROW);
  }

  void changeUserNameCursor() {
    if (mouseX >= 266 && mouseX <= 430 && mouseY >= 290 && mouseY <= 310) {
      cursor(TEXT);
    } else if (mouseX >= 266 && mouseX <= 430 && mouseY >= 370 && mouseY <= 390) {
      cursor(TEXT);
    } else if (mouseX >= 330 && mouseX <= 370 && mouseY >= 580 && mouseY <= 600) {
      cursor(HAND);
    } else cursor(ARROW);
  }

  void endProgram() {
    if (endGame) {
      startGame = false;
      
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Final score: " + player1Score + " - " + player2Score, width / 2, height / 2 - 46);

      if (player1Score == 5) {
        if (useComputer) {
          textSize(40);
          if (player2Score == 0) text("Flawless victory!", width / 2, height / 2 + 10);
          if (player2Score != 0) text("Victory", width / 2, height / 2 + 10);

          textSize(20);
          if (difficulty == 0) {
            if (p1Name == "") {
              text("You have conquered easy mode!", width / 2, height / 2 + 60);
            } else {
              text("Congratulations, " + p1Name + "! You have conquered easy mode!", width / 2, height / 2 + 60);
            }
          }
          if (difficulty == 1) {
            if (p1Name == "") {
              text("You have conquered hard mode! Thanks for playing!", width / 2, height / 2 + 60);
            } else {
              text("Congratulations, " + p1Name + "! You have conquered hard mode!", width / 2, height / 2 + 60);
            }
          }
        } else {
          textSize(40);
          if (p1Name == "") {
            text("Player 1 wins!", width / 2, height / 2 + 20);
          } else {
            text(p1Name + " wins!", width / 2, height / 2 + 20);
          }
        }
      }

      if (player2Score == 5) {
        if (useComputer) {
          textSize(40);
          text("Defeat...", width / 2, height / 2 + 10);

          if (chooseTip) {
            randomTip = int(random(tips.length));
            chooseTip = false;
          }

          textSize(18);
          text("Tip: " + tips[randomTip], width / 2, height / 2 + 60);
        } else {
          textSize(40);
          if (p2Name == "") {
            text("Player 2 wins!", width / 2, height / 2 + 20);
          } else { 
            text(p2Name + " wins!", width / 2, height / 2 + 20);
          }
        }
      }

      textSize(20);
      text("Click anywhere onscreen to return to the homepage", width / 2, height / 2 + 90);

      cheatMode = false;
    }

    if (endPractice) {
      startGame = false;
      
      fill(255);
      textAlign(CENTER);
      textSize(26);
      text("Your score: " + practiceScore, width / 2, height / 2 - 30);

      if (p1Name == "") {
        textSize(40);
        text("Practice over. Great job!", width / 2, height / 2 + 30);
      } else {
        text("Great job, " + p1Name + "!", width / 2, height / 2 + 30);
      }

      textSize(20);
      text("Click anywhere onscreen to return to the homepage", width / 2, height / 2 + 70);
    }

    if (endPortals) {
      startGame = false;
      
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Final score: " + player1Score + " - " + player2Score, width / 2, height / 2 - 46);

      textSize(40);
      if (player1Score > player2Score) text("Player 1 wins!", width / 2, height / 2 + 20);
      if (player2Score > player1Score) text("Player 2 wins!", width / 2, height / 2 + 20);
      if (player1Score == player2Score) text("Tie!", width / 2, height / 2 + 20);

      textSize(20);
      text("Click anywhere onscreen to return to the homepage", width / 2, height / 2 + 70);
    }
  }
}
