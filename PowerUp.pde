class PowerUp {
  void spawn() {
    if (!powerupSpawned) {
      powerupX = int(random(100, width - 150));
      powerupY = int(random(0, height - 50));

      powerupSpawned = true;
      powerupDisplayed = true;
    }
  }

  void display() {
    if (powerupDisplayed) {
      noStroke();

      fill(245, 218, 66);
      rect(powerupX, powerupY, 50, 50);

      fill(255);
      rect(powerupX + 6, powerupY + 6, 6, 6);
      rect(powerupX + 50 - 12, powerupY + 6, 6, 6);
      rect(powerupX + 6, powerupY + 50 - 12, 6, 6);
      rect(powerupX + 50 - 12, powerupY + 50 - 12, 6, 6);

      textAlign(CENTER);
      textSize(25);
      text("?", powerupX + 25, powerupY + 32);
    }
  }

  void collide() {
    if (ballSpeedX < 0) return;

    powerupReward = int(random(3)); // Randomly chooses a reward to give to the user

    if (powerupReward == 0) practiceScore += 4; // Add 4 to player score 

    if (powerupReward == 1) { // Slows down the ball
      if (abs(ballSpeedX) <= 6) ballSpeedX -= 3;
      if (abs(ballSpeedX) > 6) ballSpeedX -= 5;

      if (ballSpeedY > 0) {
        if (ballSpeedY <= 5) ballSpeedY -= 3;
        if (ballSpeedY > 5) ballSpeedY -= 5;
      }
      if (ballSpeedY < 0) {
        if (abs(ballSpeedY) <= 5) ballSpeedY += 3;
        if (abs(ballSpeedY) > 5) ballSpeedY += 5;
      }
    }

    if (powerupReward == 2) { // Increases player paddle size
      player1Y -= 5; // Keeps the player centered
      playerHeight += 10; // Increase player height
    }

    powerupSpawned = false; // Powerup can now spawn
    powerupDisplayed = false; // Powerup is no longer being displayed
  }
}
