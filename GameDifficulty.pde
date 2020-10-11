class GameDifficulty {
  void displayMatchDifficulty() {
    if (abs(ballSpeedX) <= 3) difficultyColor = color(40, 227, 2);
    if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 6) difficultyColor = color(163, 227, 2);
    if (abs(ballSpeedX) > 6 && abs(ballSpeedX) <= 9) difficultyColor = color(255, 226, 3);
    if (abs(ballSpeedX) > 9) difficultyColor = color(225, 99, 3);

    if (practice) {
      fill(255);
      textSize(16);
      textAlign(CENTER);
      text("Difficulty", width - 80, 30);

      stroke(255);
      strokeWeight(2);
      fill(0);
      rect(width - 120, 46, 100, 20);

      fill(difficultyColor);
      if (abs(ballSpeedX) < 12) rect(width - 120, 46, round(abs(ballSpeedX * (25/3))), 20); // Abs puts everything into positive
      if (abs(ballSpeedX) >= 12) rect(width - 120, 46, 100, 20);
    } else {
      if (player2Y > 88) {
        fill(255);
        textSize(16);
        textAlign(CENTER);
        text("Difficulty", width - 80, 30);

        stroke(255);
        strokeWeight(2);
        fill(0);
        rect(width - 120, 46, 100, 20);

        fill(difficultyColor);
        if (abs(ballSpeedX) < 12) rect(width - 120, 46, round(abs(ballSpeedX * (25/3))), 20); // Abs puts everything into positive
        if (abs(ballSpeedX) >= 12) rect(width - 120, 46, 100, 20);
      }
    }
  }
}
