class HomePage {
  void display() {
    noStroke();

    fill(starsR, starsG, starsB);
    rect(0, 0, width, 80);

    if (starsR == 255 && starsG >= 0 && starsG < 255 && starsB == 0) {
      starsG++;
    } else if (starsR > 0 && starsR <= 255 && starsG == 255 && starsB == 0) {
      starsR--;
    } else if (starsR == 0 && starsG == 255 && starsB >= 0 && starsB < 255) {
      starsB++;
    } else if (starsR == 0 && starsG > 0 && starsG <= 255 && starsB == 255) {
      starsG--;
    } else if (starsR >= 0 && starsR < 255 && starsG == 0 && starsB == 255) {
      starsR++;
    } else if (starsR == 255 && starsG == 0 && starsB <= 255 && starsB > 0) {
      starsB--;
    } 

    fill(0);
    for (int i = 0; i <= width; i += 20) {
      for (int j = 0; j < 100; j += 20) {
        ellipse(i, j, 20, 20);
      }
    }

    fill(starsR, starsG, starsB);

    rect(0, height - 40, 40, 40);
    rect(width - 40, height - 40, 40, 40);

    rect(0, height - 60, 20, 20);
    rect(40, height - 20, 20, 20);
    rect(width - 20, height - 60, 20, 20);
    rect(width - 60, height - 20, 20, 20);

    rect(0, height - 70, 10, 10);
    rect(60, height - 10, 10, 10);
    rect(width - 10, height - 70, 10, 10);
    rect(width - 70, height - 10, 10, 10);

    rect(width / 2 - 100, height - 20, 200, 20);
    rect(width / 2 - 110, height - 10, 10, 10);
    rect(width / 2 + 100, height - 10, 10, 10);
    rect(width / 2 - 40, height - 40, 80, 40);

    fill(255);
    textSize(14);
    textAlign(LEFT);
    text(currentVersion, 10, 100);

    titleBallLocation.add(titleBallVelocity);
    titleBallVelocity.add(titleBallGravity);

    if (titleBallLocation.y > 237) {
      titleBallVelocity.y *= -0.8;
      titleBallLocation.y = 237.6;
    }

    fill(255);
    textAlign(CENTER);

    textSize(60);
    text("P   NG", width / 2, height / 2 - 90);

    fill(0);
    stroke(255);
    strokeWeight(5);
    ellipse(325, titleBallLocation.y, 40, 40);

    fill(255);
    noStroke();
    textSize(28);
    textAlign(CENTER);
    text("By Jeremy Liu", width / 2, height / 2 - 42);

    if (!chooseGame) {
      textSize(28);
      textAlign(CENTER);
      text("Play", width / 2, height / 2 - 2);
      text("Other", width / 2, height / 2 + 40);
    }

    textAlign(CENTER);

    if (currentPage == 1) {
      textSize(20);
      text("Game Info | Welcome", width / 2, height / 2 + 80);

      textSize(16);
      text("Welcome to Pong!", width / 2, height / 2 + 100);
      text("Please read all the instructions before starting the game.", width / 2, height / 2 + 120);
      text("Click the \"Next\" and \"Back\" buttons to go through all the instructions.", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! Read footers like this one for more information on the current topic!", width / 2, height / 2 + 220);
    }

    if (currentPage == 2) {
      textSize(20);
      text("Game Info | Players", width / 2, height / 2 + 80);

      textSize(16);
      text("Player 1 (the player on the left) is controlled by W and S keys.", width / 2, height / 2 + 100);
      text("Player 2 (the player on the right) is controlled by up and down arrow keys.", width / 2, height / 2 + 120);
      text("Player 2 can only be controlled in 2 player mode.", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! The ball's velocity will be adjusted based on player velocity!", width / 2, height / 2 + 220);
      text("PSST! The player speeds will increase as the game goes on!", width / 2, height / 2 + 240);
      text("PSST! You can use skins for the paddles! Press Z for player 1 and M for player 2!", width / 2, height / 2 + 260);
    }

    if (currentPage == 3) {
      textSize(20);
      text("Game Info | Gamemodes", width / 2, height / 2 + 80);

      textSize(16);
      text("You can choose whether you want to play with or without the computer.", width / 2, height / 2 + 100);
      text("First, try your hand at 1P easy mode. If you're confident, try hard mode.", width / 2, height / 2 + 120);
      text("Of course, you can always choose to play with a friend as well.", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! 1P hard mode is not recommended for beginners! But there is ONE thing...", width / 2, height / 2 + 220);
      text("PSST! This version of Pong does not use real physics calculations to control the computer.", width / 2, height / 2 + 240);
    }

    if (currentPage == 4) {
      textSize(20);
      text("Game Info | Scoring", width / 2, height / 2 + 80);

      textSize(16);
      text("You will get 1 point if you get the ball past your opponent.", width / 2, height / 2 + 100);
      text("First player to 5 points wins.", width / 2, height / 2 + 120);
      text("When you're ready, see if you can beat 1P hard mode!", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! There is a secret way to win every match, for those who are willing to find it...", width / 2, height / 2 + 220);
    }

    if (currentPage == 5) {
      textSize(20);
      text("Game Info | Practice", width / 2, height / 2 + 80);

      textSize(16);
      text("You can always enter a practice match from the homepage.", width / 2, height / 2 + 100);
      text("You will get 1 point every time you hit the ball.", width / 2, height / 2 + 120);
      text("You have 3 lives. You will lose a life every time the ball gets past you!", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! The portal that appears at 30 points will do as it pleases. Beware!", width / 2, height / 2 + 220);
      text("PSST! Powerups will spawn periodically spawn into the game! Collect them for an advantage!", width / 2, height / 2 + 240);
    }

    if (currentPage == 6) {
      textSize(20);
      text("Game Info | Portal PvP", width / 2, height / 2 + 80);

      textSize(16);
      text("The ball will travel directly from player to player!", width / 2, height / 2 + 100);
      text("On defense, you get 1 point every time you catch the ball.", width / 2, height / 2 + 120);
      text("On offense, you get 8 points if you get the ball past your opponent!", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! The ball's vertical direction may be reversed when it passes through the portals! Beware!", width / 2, height / 2 + 220);
    }

    if (currentPage == 7) {
      textSize(20);
      text("Game Info | Keyboard Shortcuts", width / 2, height / 2 + 80);

      textSize(16);
      text("Press P to pause a round that has already started.", width / 2, height / 2 + 100);
      text("Press R to restart the round, and press SHIFT+R to restart the program.", width / 2, height / 2 + 120);
      text("Press SHIFT+Q to close the program.", width / 2, height / 2 + 150);
    }

    if (currentPage == 8) {
      textSize(20);
      text("Game Info | Additional Info", width / 2, height / 2 + 80);

      textSize(16);
      text("Click on the version number in the top-left corner to read the patch notes.", width / 2, height / 2 + 100);
      text("When you're ready, click on a mode to begin!", width / 2, height / 2 + 120);
      text("Good luck!", width / 2, height / 2 + 150);

      textSize(14);
      text("PSST! Patch notes contains information and details about the most recent series of updates!", width / 2, height / 2 + 220);
    }

    textSize(18);
    if (currentPage != 8) text("Next >", width / 2 + 60, height / 2 + 180);
    if (currentPage != 1) text("< Back", width / 2 - 60, height / 2 + 180);

    if (chooseGame) {
      fill(0, 0, 0, 160);
      rect(0, 0, width, height);

      fill(0);
      stroke(255);
      strokeWeight(2);
      rect(140, 80, 440, 540);

      noStroke();
      fill(255);
      textAlign(CENTER);

      if (battleMode) {
        textSize(36);
        text("Battle", width / 2, 150);
        
        textSize(24);
        text("1 Player | Easy", width / 2, 220);
        text("1 Player | Hard", width / 2, 260);
        text("2 Player | PvP", width / 2, 300);
      }

      if (otherMode) {
        textSize(36);
        text("Other", width / 2, 150);
        
        textSize(24);
        text("Practice mode", width / 2, 220);
        text("Portals | PvP", width / 2, 260);
        text("Inverse mode: " + inverseMode, width / 2, 300);
        text("Usernames", width / 2, 340);
      }
    }
  }
}
