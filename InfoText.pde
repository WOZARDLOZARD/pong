class InfoText {
  void displayScores() {
    // Displays the scores of the two players/the one player depending on if the user is practicing
    noStroke();
    textAlign(CENTER);
    textSize(30);

    if (player1Score == 4) p1ScoreColor = color(255, 213, 0);
    if (player2Score == 4) p2ScoreColor = color(255, 213, 0);

    if (!practice) {
      if (!portalMode) {  
        if (startGame) return;

        fill(p1ScoreColor);
        text(player1Score, width / 2 - 100, 60);

        fill(p2ScoreColor);
        text(player2Score, width / 2 + 100, 60);

        fill(255);
        textSize(40);
        text("PONG", width / 2, 60);

        if (p1Name != "") {
          textSize(20);
          textAlign(LEFT);
          text(p1Name, 20, 40);
        }

        if (p2Name != "" && !useComputer) {
          textSize(20);
          textAlign(RIGHT);
          text(p2Name, width - 20, 40);
        }

        if (useComputer) {
          textSize(20);
          textAlign(RIGHT);
          text("Computer", width - 20, 40);
        }
      } else {
        if (!startGame) {
          fill(255);
          textAlign(CENTER);
          text(player1Score, width / 2 - 150, 60);
          text(player2Score, width / 2 + 150, 60);

          fill(255);
          textSize(40);
          text("PORTALS", width / 2, 60);

          if (p1Name != "") {
            textSize(20);
            textAlign(LEFT);
            text(p1Name, 20, 40);
          }

          if (p2Name != "") {
            textSize(20);
            textAlign(RIGHT);
            text(p2Name, width - 20, 40);
          }
        }

        fill(255);
        textAlign(CENTER);
        textSize(18);
        text("Rounds left: " + portalRounds, 80, 30);
      }
    } else {
      text(practiceScore, width / 2 - 150, 60);

      fill(255);
      ellipse(height - 40, 100, 40, 40);

      fill(0);
      textSize(18);
      text("x" + practiceLives, height - 40, 105);

      fill(255);
      textSize(40);
      text("PRACTICE", width / 2, 60);

      if (p1Name != "") {
        textSize(20);
        textAlign(LEFT);
        text(p1Name, 20, 40);
      }

      if (!startGame) {
        textAlign(RIGHT);
        textSize(20);
        text("Trainer", width - 20, 40);
      }
    }
  }

  void displayStartText() {
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(startText, width / 2, height / 2 - 50);
  }

  void displayRoundsLeft() {
    if (portalRounds >= 4) roundsLeftColor = color(40, 227, 2);
    if (portalRounds == 3) roundsLeftColor = color(163, 227, 2);
    if (portalRounds == 2) roundsLeftColor = color(255, 226, 3);
    if (portalRounds == 1) roundsLeftColor = color(225, 99, 3);

    stroke(255);
    strokeWeight(2);
    fill(0);
    rect(20, 46, 100, 20);

    fill(roundsLeftColor);
    rect(20, 46, portalRounds * 20, 20);
  }
}
