class Players {
  void display() {
    fill(255); // White fill
    strokeWeight(2);

    stroke(66, 135, 245);
    rect(40, player1Y, 22, playerHeight); // Player 1

    stroke(232, 0, 0);
    rect(width - 62, player2Y, 22, 150); // Player 2

    if (portalMode) {
      noStroke();
      fill(portalR, portalG, portalB);
      rect(51, player1Y, 11, 150); // Player 1
      rect(width - 62, player2Y, 11, 150); // Player 2 

      if (startGame) {
        if (portalR == 255 && portalG >= 0 && portalG < 255 && portalB == 0) {
          portalG++;
        } else if (portalR > 0 && portalR <= 255 && portalG == 255 && portalB == 0) {
          portalR--;
        } else if (portalR == 0 && portalG == 255 && portalB >= 0 && portalB < 255) {
          portalB++;
        } else if (portalR == 0 && portalG > 0 && portalG <= 255 && portalB == 255) {
          portalG--;
        } else if (portalR >= 0 && portalR < 255 && portalG == 0 && portalB == 255) {
          portalR++;
        } else if (portalR == 255 && portalG == 0 && portalB <= 255 && portalB > 0) {
          portalB--;
        }
      }
    }
  }

  void moveP1() {
    if (moveP1Up) {
      if (inverseControls) {
        if (player1Y < height - playerHeight) {
          if (abs(ballSpeedX) <= 3) player1Y += 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player1Y += 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player1Y += 8;
          if (abs(ballSpeedX) > 10) player1Y += 10;
        }
      } else {
        if (player1Y > 0) {
          if (abs(ballSpeedX) <= 3) player1Y -= 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player1Y -= 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player1Y -= 8;
          if (abs(ballSpeedX) > 10) player1Y -= 10;
        }
      }
    }

    if (moveP1Down) {
      if (inverseControls) {
        if (player1Y > 0) {
          if (abs(ballSpeedX) <= 3) player1Y -= 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player1Y -= 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player1Y -= 8;
          if (abs(ballSpeedX) > 10) player1Y -= 10;
        }
      } else {
        if (player1Y < height - playerHeight) {
          if (abs(ballSpeedX) <= 3) player1Y += 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player1Y += 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player1Y += 8;
          if (abs(ballSpeedX) > 10) player1Y += 10;
        }
      }
    }
  }

  void moveP2() {
    if (moveP2Up) {
      if (inverseControls) {
        if (player2Y < height - 150) {
          if (abs(ballSpeedX) <= 3) player2Y += 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player2Y += 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player2Y += 8;
          if (abs(ballSpeedX) > 10) player2Y += 10;
        }
      } else {
        if (player2Y > 0) {
          if (abs(ballSpeedX) <= 3) player2Y -= 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player2Y -= 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player2Y -= 8;
          if (abs(ballSpeedX) > 10) player2Y -= 10;
        }
      }
    }

    if (moveP2Down) {
      if (inverseControls) {
        if (player2Y > 0) {
          if (abs(ballSpeedX) <= 3) player2Y -= 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player2Y -= 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player2Y -= 8;
          if (abs(ballSpeedX) > 10) player2Y -= 10;
        }
      } else {
        if (player2Y < height - 150) {
          if (abs(ballSpeedX) <= 3) player2Y += 4;
          if (abs(ballSpeedX) > 3 && abs(ballSpeedX) <= 7) player2Y += 6;
          if (abs(ballSpeedX) > 7 && abs(ballSpeedX) <= 10) player2Y += 8;
          if (abs(ballSpeedX) > 10) player2Y += 10;
        }
      }
    }
  }

  void p1Hit() {
    ballSpeedX *= -1;

    if (practice) {
      practiceScore++;

      if (practiceScore >= 30) usingPortal = true;

      if (abs(ballSpeedX) < 12) ballSpeedX++;

      if (moveP1Up && player1Y > 0) {
        if (inverseControls) ballSpeedY += 2;
        if (!inverseControls) ballSpeedY -= 2;
      }
      if (moveP1Down && player1Y < height - playerHeight) {
        if (inverseControls) ballSpeedY -= 2;
        if (!inverseControls) ballSpeedY += 2;
      }

      return;
    }

    if (portalMode && defendingSide == 1) {
      ballX = width - 62 - 9;
      ballY = player2Y + 50;

      player1Score++;

      ballSpeedX *= -1;

      ballYDir = int(random(1, 3));
      if (ballYDir == 1) ballSpeedY *= -1;

      if (abs(ballSpeedX) < 12) ballSpeedX--;

      if (abs(ballSpeedX) > 2 && abs(ballSpeedY) < 3) {
        if (ballSpeedY > 0) ballSpeedY++;
        if (ballSpeedY < 0) ballSpeedY--;
      }

      if (abs(ballSpeedX) > 5 && abs(ballSpeedY) >= 3 && abs(ballSpeedY) < 7) {
        if (ballSpeedY > 0) ballSpeedY++;
        if (ballSpeedY < 0) ballSpeedY--;
      }

      if (abs(ballSpeedX) > 8 && abs(ballSpeedY) >= 7) {
        if (ballSpeedY > 0) ballSpeedY += 2;
        if (ballSpeedY < 0) ballSpeedY -= 2;
      }

      return;
    }

    if (abs(ballSpeedX) < 12) ballSpeedX++;

    if (moveP1Up && player1Y > 0) {
      if (inverseControls) ballSpeedY += 2;
      if (!inverseControls) ballSpeedY -= 2;
    }
    if (moveP1Down && player1Y < height - playerHeight) {
      if (inverseControls) ballSpeedY -= 2;
      if (!inverseControls) ballSpeedY += 2;
    }
  }

  void p2Hit() {
    ballSpeedX *= -1;

    if (portalMode && defendingSide == 2) {
      ballX = 62 + 9;
      ballY = player1Y + 50;

      player2Score++;

      ballSpeedX *= -1;

      ballYDir = int(random(1, 3));
      if (ballYDir == 1) ballSpeedY *= -1;

      if (abs(ballSpeedX) < 12) ballSpeedX++;

      if (abs(ballSpeedX) > 2 && abs(ballSpeedY) < 3) {
        if (ballSpeedY > 0) ballSpeedY++;
        if (ballSpeedY < 0) ballSpeedY--;
      }

      if (abs(ballSpeedX) > 5 && abs(ballSpeedY) >= 3 && abs(ballSpeedY) < 7) {
        if (ballSpeedY > 0) ballSpeedY++;
        if (ballSpeedY < 0) ballSpeedY--;
      }

      if (abs(ballSpeedX) > 8 && abs(ballSpeedY) >= 7) {
        if (ballSpeedY > 0) ballSpeedY += 2;
        if (ballSpeedY < 0) ballSpeedY -= 2;
      }

      return;
    }

    if (abs(ballSpeedX) < 12) ballSpeedX--;

    if (!practice && !portalMode && !useComputer) {
      if (moveP2Up && player2Y > 0) {
        if (inverseControls) ballSpeedY += 2;
        if (!inverseControls) ballSpeedY -= 2;
      }
      if (moveP2Down && player2Y < height - 75) {
        if (inverseControls) ballSpeedY -= 2;
        if (!inverseControls) ballSpeedY += 2;
      }
    }
  }
}
