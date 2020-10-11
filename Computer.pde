class Computer {
  void move() {
    if (cheatMode && !practice) {
      if (abs(ballSpeedY) <= 3) computerEasing = 0.025;
      if (abs(ballSpeedY) > 3 && abs(ballSpeedY) <= 7) computerEasing = 0.0125;
      if (abs(ballSpeedY) > 7) computerEasing = 0.01;
    } else if (!cheatMode && !practice) {
      if (difficulty == 0) computerEasing = 0.06;
      if (difficulty == 1) computerEasing = 0.105;
    }

    if (practice) computerEasing = 1;

    player2Y += (ballY - (player2Y + 75)) * computerEasing;
  }
}
