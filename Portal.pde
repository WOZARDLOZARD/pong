class Portal {
  void control() {
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

    fill(255);
    rect(width / 2 - 11, practiceObstacleY, 22, practiceObstacleHeight);
    fill(portalR, portalG, portalB);
    rect(width / 2 - 11, practiceObstacleY, 5, practiceObstacleHeight);
    rect(width / 2 + 6, practiceObstacleY, 5, practiceObstacleHeight);

    if (practiceObstacleY >= height) {
      if (practiceScore >= 30 && practiceScore < 40) {
        practiceObstacleSpeed = -2;
        practiceObstacleHeight = 120;
      }
      
      if (practiceScore >= 40) {
        practiceObstacleSpeed = -3;
        practiceObstacleHeight = 150;
      }
    }

    if (practiceObstacleY <= (-1 * practiceObstacleHeight)) {
      if (practiceScore >= 30 && practiceScore < 40) {
        practiceObstacleSpeed = 2; 
        practiceObstacleHeight = 120;
      }

      if (practiceScore >= 40) {
        practiceObstacleSpeed = 3; 
        practiceObstacleHeight = 150;
      }
    }

    practiceObstacleY += practiceObstacleSpeed;

    if (ballX + 9 > 339 && ballX - 9 < 339 + 22 && ballY + 9 >= practiceObstacleY && ballY - 9 <= practiceObstacleY + practiceObstacleHeight) { // The portal in the middle of screen
      if (ballSpeedX > 0) {
        ballX = 339 + 22 + 9;
        ballSpeedY *= -1;
      } else if (ballSpeedX < 0) {
        ballX = 339 - 9;
        ballSpeedY *= -1;
      }
    }
  }
}
