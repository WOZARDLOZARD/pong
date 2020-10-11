class Ball {
  void display() { // Draws the ball
    noStroke();
    fill(255);
    ellipse(ballX, ballY, 36, 36); // Draws white ball at its x and y coordinates with a diameter of 36 pixels
  }

  void startMoving() { // Launches the ball
    ballYDir = int(random(1, 3)); // Picks a random direction (not actual direction

    if (practice) { // If the user is practicing
      if (practiceScore >= 0 && practiceScore < 5) { // If the ball is still moving slow
        ballSpeedX = int(random(-2, -4)); // Launch ball towards user at random speed

        if (ballYDir == 1) ballSpeedY = int(random(2, 4)); // Either makes the ball's y speed positive or negative
        if (ballYDir == 2) ballSpeedY = int(random(-2, -4));
      } 

      if (practiceScore >= 5 && practiceScore < 10) {
        ballSpeedX = int(random(-2, -4)); // Launch ball towards user at random speed, but it's now faster
        
        if (ballYDir == 1) ballSpeedY = int(random(2, 4)); // Either makes the ball's y speed positive or negative
        if (ballYDir == 2) ballSpeedY = int(random(-2, -4));
      }

      if (practiceScore >= 10 && practiceScore < 20) {
        ballSpeedX = int(random(-3, -5)); // Launch ball towards user at random speed, but it's now faster
        
        if (ballYDir == 1) ballSpeedY = int(random(3, 5)); // Either makes the ball's y speed positive or negative
        if (ballYDir == 2) ballSpeedY = int(random(-3, -5));
      }

      if (practiceScore >= 20) {
        ballSpeedX = int(random(-4, -6)); // Launch ball towards user at random speed, but it's now faster
        
        if (ballYDir == 1) ballSpeedY = int(random(4, 6)); // Either makes the ball's y speed positive or negative
        if (ballYDir == 2) ballSpeedY = int(random(-4, -6));
      }

      return; // Exit out of the function to prevent conflicting commands
    }

    // If the user isn't in practice mode
    ballXDir = int(random(1, 3)); // Picks a random ball speed x direction
    if (ballXDir == 1) ballSpeedX = int(random(2, 4)); // Ball could be launched towards P1 or P2
    if (ballXDir == 2) ballSpeedX = int(random(-2, -4));
    if (ballYDir == 1) ballSpeedY = int(random(2, 4)); // Ball y speed could either be positive or negative
    if (ballYDir == 2) ballSpeedY = int(random(-2, -4));

    if (portalMode) { // If the mode is Portals
      if (ballSpeedX < 0) defendingSide = 1; // Setup some variables for scorekeeping and functionality
      if (ballSpeedX > 0) defendingSide = 2;
    }
  }

  void move() { // Moves ball
    ballX += ballSpeedX; // Add values to ball's x and y values to make it move
    ballY += ballSpeedY;

    if (ballY - 9 < 0 || ballY + 9 > height) ballSpeedY *= -1; // If the ball has reached the top/bottom of the screen, make it bounce off
  }

  void end() {
    if (ballX - 9 <= 0) { // If the ball has gotten past P1
      if (practice) { // If user is practicing
        if (practiceLives == 1) { // If user has only 1 life when the ball gets past it (when they have only 1 life, then they'll now have 0 lives)
          endPractice = true; // Set end practice to true

          startGame = false; // Game is no longer started
        }

        if (practiceLives > 0) { // If the player still has lives
          practiceLives--; // Take away a life

          // Reset ball and player coordinates
          ballSpeedX = 0; 
          ballSpeedY = 0;
          ballX = width / 2;
          ballY = width / 2;
          player1Y = height / 2 - playerHeight / 2;
          player2Y = height / 2 - 75; 

          practiceObstacleY = -1 * practiceObstacleHeight; // Reset practice portal position
          practiceObstacleSpeed = 1; // Reset its speed

          startGame = false; // Game is no longer started
          
          powerupSpawned = false; // Won't give user powerup if user loses a life
          powerupDisplayed = false; // Remove powerup from the screen
        }

        return; // Exit out of the function to prevent conflicting commands
      }

      if (portalMode) { // If the mode is Portals PvP
        if (portalRounds == 1) { // If there are no more rounds left
          player2Score += 6; // Give player 2 their points

          endPortals = true; // End the game

          startGame = false;
        } else { // If there are still rounds left
          player2Score += 6; // Award points to P2

          portalRounds--; // Take away a round

          // Reset ball and player coordinates
          ballSpeedX = 0;
          ballSpeedY = 0;
          ballX = width / 2;
          ballY = width / 2;
          player1Y = height / 2 - 75;
          player2Y = height / 2 - 75; 

          // Reset portal colors
          portalR = 255;
          portalG = 0;
          portalB = 0;

          startGame = false; // The game is no longer started
        }

        return; // Do not run code below
      }

      if (player2Score == 4) { // If the mode is not practice or portals
        player2Score++; // Add 1 to their score for display purposes

        startGame = false; 
        endGame = true; // End match

        return; // Do not run code below
      }

      startText = "Press space to start!"; // Reset start text
      cheatMode = false; // Cheat mode is no longer activated

      // Reset ball and player coordinates
      ballX = width / 2;
      ballY = height / 2;
      ballSpeedX = 0;
      ballSpeedY = 0;

      player1Y = height / 2 - playerHeight / 2;
      player2Y = height / 2 - 75;

      player2Score++; // Add 1 to P2 score

      startGame = false; // Game is no longer started
    }

    if (ballX + 9 >= width) { // If the ball has gotten past P2
      if (portalMode) { // If the mode is portals
        if (portalRounds <= 1) {
          player1Score += 6; // Award points to P1

          endPortals = true; // The round has ended

          startGame = false;
        } else {
          player1Score += 6; // Award points to P1

          portalRounds--; // Take away a round

          // Reset ball and player coordinates
          ballSpeedX = 0;
          ballSpeedY = 0;
          ballX = width / 2;
          ballY = width / 2;
          player1Y = height / 2 - playerHeight / 2;
          player2Y = height / 2 - 75; 

          // Reset portal colors
          portalR = 255;
          portalG = 0;
          portalB = 0;

          startGame = false;
        }

        return; // Do not run code below
      }

      if (player1Score == 4) { // If P1 was at match point
        player1Score++; // Award them their points

        endGame = true; // End the round
        
        startGame = false;

        return; // Do not run code below
      }

      startText = "Press space to start!"; // Reset start text
      cheatMode = false; // Cheat mode is no longer activated

      // Reset ball and player coordinates
      ballX = width / 2;
      ballY = height / 2;
      ballSpeedX = 0;
      ballSpeedY = 0;

      player1Y = height / 2 - playerHeight / 2;
      player2Y = height / 2 - 75; 

      player1Score++; // Award P1 1 point

      startGame = false; // Game is no longer started
    }
  }
}
