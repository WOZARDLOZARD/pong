/*

 * Assignment name: Pong
 * Made by: Jeremy Liu
 * Date completed: December 3, 2019
 
 * I verify that this program is made by me. - J.L.
 
 This program is a simulator for the game Pong. There are the three classic modes (1
 player easy, 1 player hard, and 2 player), as well as a practice mode and a new mode 
 that I added. There is a homepage that includes information about all gamemodes in the
 game, as well as patch notes to document the most recent changes that I have made to 
 this program. 
 
 */


// OBJECTS | This contains all objects that will be used

Ball ball; // Ball variable
Players players; // Players variable
UserNames userNames; // Usernames variable
PowerUp powerUp; // Powerup variable
Skins skins; // Player skins variable
InfoText infoText; // Info text variable
Computer computer; // AI variable 
GameDifficulty gameDifficulty; // Game difficulty variable
Portal portal; // Portal variable (for practice and Portals mode)
HomePage homePage; // Homepage variable 
PatchNotes gamePatchNotes; // Patch notes variable
Client client; // A variable that controls the program (eg. restarting it, exiting it, etc.)

// VARIABLE LIST | This contains all variables that will be used

float player1Y, player2Y; // Postion of the 2 players

int powerupX, powerupY;

int p1Skin; // Which skin the two players are using
int p2Skin;

int playerHeight = 150; // Height of player 1's paddle (used for 1P modes)
int practiceObstacleHeight = 120; // Height of practice obstacle (used for practice)

int practiceScore; // Score in practice mode

float computerEasing; // How fast the computer moves

float ballX, ballY; // Position of ball

int ballSpeedX, ballSpeedY; // Speed of ball

int ballXDir, ballYDir; // Direction of ball

int player1Score, player2Score; // Scores of the two players
color p1ScoreColor, p2ScoreColor; // Score colors of the two players
color roundsLeftColor; // Color of rounds left bar in Portals mode

color difficultyColor;

int practiceLives = 3; // Lives left in practice mode

PVector titleBallLocation, titleBallVelocity, titleBallGravity; // Vectors for the ellipse used in the homepage

boolean useComputer = false; // Whether the computer is being used or not
int difficulty = 0; // If computer is used, how difficult the mode is

boolean inverseControls;
String inverseMode;

int starsR = 255; // Stars decoration color on homepage
int starsG = 0;
int starsB = 0;

int portalR, portalG, portalB;

int currentPage; // Current information page on homepage

boolean practice; // Whether practice mode is enabled or not
int practiceObstacleY; // Position of practice portal
int practiceObstacleSpeed = 1; // Speed of practice portal

boolean portalMode; // Whether Portals mode is enabled or not
int defendingSide; // Which side is defending
int portalRounds = 5; // How many rounds are left

boolean startScreen = true; // If the launch screen is being displayed or not
int textOpacity = 1; // Opacity of text on launch
int textOpacityChange = 1; // Change in launch text opacity

boolean chooseMode = false; // Whether or not the homepage is being displayed
boolean chooseGame;
boolean battleMode;
boolean otherMode;

boolean startGame, endGame, endPractice, endPortals; // The game has not started or ended
boolean cheatMode; // The user isn't cheating
boolean usingPortal; // The practice portal isn't being used

boolean patchNotes; // Patch notes are not being displayed

boolean powerupSpawned, powerupDisplayed; // Whether or not the powerup is being displayed
int powerupReward; // Random powerup reward

boolean moveP1Up, moveP1Down, moveP2Up, moveP2Down; // Whether the players are moving or not

boolean paused; // Whether or not the program is paused

String startText = "Press space to start!"; // Text on start of every round

String[] tips = { // Creates an array of tips
  "Try to predict where the ball will be when it reaches your side!", 
  "Make sure that you are focused at all times!", 
  "Do not underestimate the computer!", 
  "Try to play a few Practice matches before playing a match!", 
  "Try to move your paddle strategically to control the ball's vertical speed!"
};
int randomTip; // Chooses a random tip from the array
boolean chooseTip; // Whether or not a tip will be chosen

// Username variables
String p1Name = "";
String p2Name = "";
boolean receivingP1Input, receivingP2Input;
boolean inputtingNames;
String[] randomNames = {"GrandRelish", "Guest_", "DiskCalculator", "ChiefSnowy", "HyperionNuke", "CredibleDiet", "MistyPizza", "HazyPluto", "DragonRants", "JoeMama", "CheerFish", "FlaghamDendrite", "FlumpyEwe", "SupremeFray", "MortalView", "Pong.exe", "PoloniumRadon"};
int randomName;
int guestNumber;

// Version string
String currentVersion = "v 8.2.0";


// SETTING UP THE SKETCH
// This function will be used later in the script as well, for reset purposes
void setup() {
  size(700, 700); // Window is 700x700 pixels

  ellipseMode(DIAMETER); // Draws all ellipses with diameter as the width and height unit

  smooth(); // Enables smoothing

  player1Y = height / 2 - playerHeight / 2;
  player2Y = height / 2 - 75;

  ballX = width / 2; // Sets the position of the ball
  ballY = height / 2;

  ballSpeedX = 0; // Ball is not moving
  ballSpeedY = 0;

  // Initializing objects
  ball = new Ball();
  players = new Players();
  userNames = new UserNames();
  powerUp = new PowerUp();
  skins = new Skins();
  infoText = new InfoText();
  computer = new Computer();
  gameDifficulty = new GameDifficulty();
  portal = new Portal();
  homePage = new HomePage();
  gamePatchNotes = new PatchNotes();
  client = new Client();

  titleBallLocation = new PVector(325, 100); // Constructs three PVector objects for the ellipse drawn on the homepage
  titleBallVelocity = new PVector(0, 2);
  titleBallGravity = new PVector(0, 0.2);

  player1Score = 0; // Set scores to 0
  player2Score = 0;
  practiceScore = 0;

  p1ScoreColor = color(255);
  p2ScoreColor = color(255);

  p1Skin = 0; // Reset player skins
  p2Skin = 0;

  playerHeight = 150; // Sets the height of P1 to 150 (P2 is not needed because it doesn't change)

  chooseMode = true; // User is choosing a mode

  currentPage = 1; // Sets the current game info page to 1

  starsR = 255; // Make the star color red
  starsG = 0;
  starsB = 0;

  portalR = 255; // Make the portal color red
  portalG = 0;
  portalB = 0;

  practiceLives = 3; // Set number of lives in practice mode to 3

  endGame = false; // Game has not ended
  endPractice = false; // Practice has not ended
  endPortals = false; // Portals PvP has not ended
  startGame = false; // The game has not started
  cheatMode = false; // Cheat mode is not activated
  practice = false; // Practice mode has not started
  portalMode = false; // Portals PvP has not started
  usingPortal = false; // Practice portal is not being used
  patchNotes = false; // Patch notes are not being displayed
  powerupSpawned = false; // Powerup has spawned
  powerupDisplayed = false; // Do not display the powerup
  paused = false; // The program isn't paused
  inverseControls = false; // The controls are not reversed
  chooseTip = true; // A random tip will be chosen
  receivingP1Input = false; // Player 1's username is not being inputted
  receivingP2Input = false; // Player 2's username is not being inputted
  inputtingNames = false; // Usernames are not being inputted
  chooseGame = false; // A gamemode is not being chosen
  battleMode = false;  // Neither type of mode is selected
  otherMode = false;
  moveP1Up = false; // Players are not being moved
  moveP1Down = false;
  moveP2Up = false;
  moveP2Down = false;

  inverseMode = "Off"; // Display the toggle status to the user
}

void draw() {
  if (!focused) return; // If sketch isn't "focused" (window isn't selected), don't run code

  background(0); // Repeatedly draws the background

  if (startScreen) { // If the program has just been opened
    client.openGame(); // Display the launch screen

    return;
  }

  if (!chooseMode && !chooseGame) client.endProgram(); // Check if the game has ended

  if (patchNotes) gamePatchNotes.display(); // Check if the user wants to see patch notes or not

  if (chooseMode) { // If the homepage is being displayed
    client.changeCursor(); // Change the cursor type accordingly
    homePage.display();
  } else if (!chooseMode && !inputtingNames) cursor(ARROW); // Otherwise, change the cursor to an arrow

  if (inputtingNames) {
    userNames.display();
    client.changeUserNameCursor();
  }

  if (chooseMode || chooseGame || endGame || endPractice || endPortals || patchNotes || inputtingNames) return; // Don't run the rest of the code in draw() if any of these conditions are true

  players.display(); // Draw players
  skins.display(); // Draw player skins
  ball.display(); // Draw ball
  infoText.displayScores(); // Displays the scores of the two players
  if (!startGame) infoText.displayStartText(); // Displays the text shown at the start of every round
  if (portalMode) infoText.displayRoundsLeft(); // Displays the number of rounds left

  if (startGame) { // If the game has started
    if (moveP1Up || moveP1Down) players.moveP1(); // Move player 1
    if (!useComputer && moveP2Up || !useComputer && moveP2Down) players.moveP2(); // Move player 2 if applicable
    if (ballX - 9 < 40 + 22 && ballX + 9 > 40 && ballY + 9 > player1Y && ballY - 9 < player1Y + playerHeight) players.p1Hit(); // Checks if player 1 has hit the ball
    if (ballX + 9 > width - 62 && ballX - 9 < width - 40 && ballY + 9 > player2Y && ballY - 9 < player2Y + 150) players.p2Hit(); // Checks if player 2 has hit theball.move(); // Move the ball
    if (ballX - 9 <= 0 || ballX + 9 >= width) ball.end(); // Check if the ball has gotten past players
    ball.move(); // Moves the ball

    if (practice) {
      if (usingPortal) portal.control(); // Control the practice portal

      if (practiceScore == 5 || practiceScore == 15 || practiceScore == 25 || practiceScore == 35 || practiceScore == 45 || practiceScore == 55 || practiceScore == 65 || practiceScore == 75 || practiceScore == 85 || practiceScore == 95) {
        if (!powerupDisplayed) powerUp.spawn();
      }
      
      if (powerupDisplayed) {
        powerUp.display();
        if (ballX + 9 > powerupX && ballX - 9 < powerupX + 50 && ballY - 9 > powerupY && ballY + 9 < powerupY + 50) powerUp.collide();
      }
    }

    if (useComputer && startGame) computer.move(); // Use the computer if necessary
    if (startGame) gameDifficulty.displayMatchDifficulty(); // Display the match difficulty bar (for Portals and normal modes)
  }
}

void keyPressed() {
  if (chooseMode || !startGame || endGame || paused || endPractice || endPortals) return; // Do not run the code in keyPressed() if any of these conditions are true

  if (key == 'w'|| key == 'W') moveP1Up = true; // P1 is moving up if the W key is pressed
  if (key == 's' || key == 'S') moveP1Down = true; // P1 is moving up if the S key is pressed

  if (!useComputer) { // If the mode is not 1 player
    if (keyCode == UP) moveP2Up = true; // P2 is moving up if the up arrow key is pressed
    if (keyCode == DOWN) moveP2Down = true; // P2 is moving down if the down arrow key is pressed
  }
}

void keyReleased() {
  if (key == 'Q' && !receivingP1Input && !receivingP2Input) exit(); // If SHIFT+Q is pressed, quit the program

  if (key == 'R' && !receivingP1Input && !receivingP2Input) client.restartAll(); // If SHIFT+R is pressed, restart the entire program
  
  if (chooseGame && keyCode == ENTER || chooseMode && keyCode == RETURN) {
    chooseGame = false;
    battleMode = false;
    otherMode = false;
  }

  if (inputtingNames) {
    if (keyCode == ENTER || keyCode == RETURN) {
      userNames.censor();

      if (p1Name.length() == 0) {
        p1Name = "Player 1 name";
      }
      if (p2Name.length() == 0) {
        p2Name = "Player 2 name";
      }

      receivingP1Input = false;
      receivingP2Input = false;

      return;
    }

    if (receivingP1Input) userNames.inputP1Name();
    if (receivingP2Input) userNames.inputP2Name();

    return;
  }

  // Do not run the code if the game has ended or if the user is choosing a mode
  if (endGame || endPractice || endPortals || chooseMode || inputtingNames) return;

  if (!startGame) { // If the game has not been started
    if (key == ' ') { // If the space bar is released
      ball.startMoving(); // Launch the ball

      startGame = true; // Start the game
    }

    if (key == 'z' || key == 'Z') {
      skins.p1Change();
    }

    if (key == 'm' && !useComputer || key == 'M' && !useComputer) {
      skins.p2Change();
    }
  } 

  if (key == 'p' && startGame || key == 'P' && startGame) client.pause(); // If the game has started and the P key has been pressed, pause/unpause the game

  if (key == 'r' && !patchNotes && useComputer) client.restart(); // Restart the round if the R key has been pressed

  if (key == 'w') moveP1Up = false; // P1 is no longer moving up
  if (key == 's') moveP1Down = false; // P1 is no longer moving down

  if (!useComputer) { // If the mode is not 1P
    if (keyCode == UP) moveP2Up = false; // P2 is no longer moving up
    if (keyCode == DOWN) moveP2Down = false; // P2 is no longer moving down
  }
}

void mouseReleased() {
  //println(mouseX, mouseY); // This is for development purposes

  if (startScreen) { // If the start screen is being displayed
    startScreen = false; // Stop the screen from being displayed
    chooseMode = true; // Allow the user to choose a mode
    // This effectively skips the start screen displayed on launch

    return; // Exit out of mouseReleased() to prevent potential problems
  }

  if (!startGame && !chooseMode && !endGame && useComputer && !practice) { // If the player is playing against a computer
    if (mouseX >= 250 && mouseX <= 450 && mouseY >= 286 && mouseY <= 300) { // If the user has clicked on the start text
      if (!cheatMode) {
        startText = "Cheat mode activated!"; // Enable cheat mode if it's disabled
        cheatMode = true;
      } else {
        startText = "Press space to start!"; // Disable cheat mode if it's already enabled
        cheatMode = false;
      }
    }
  }

  if (endPortals) { // If the Portals mode has ended
    setup(); // Run all things in the setup() void

    return; // Don't run code below
  }

  if (endPractice) {
    setup(); // Run all things in the setup() void

    return; // Don't run code below
  }

  if (endGame) {
    setup(); // Run all things in the setup() void

    return; // Don't run code below
  }

  if (endPortals) {
    setup(); // Run all things in the setup() void

    return; // Don't run code below
  }

  if (patchNotes) {
    setup(); // Run all things in the setup() void

    return; // Don't run code below
  }

  if (chooseMode) {
    if (mouseX >= 325 && mouseX <= 380 && mouseY >= 330 && mouseY <= 350) {
      chooseGame = true;
      battleMode = true;
    }

    if (mouseX >= 310 && mouseX <= 390 && mouseY >= 370 && mouseY <= 390) {
      chooseGame = true;
      otherMode = true;
    }

    if (battleMode) {
      if (mouseX >= 270 && mouseX <= 430 && mouseY >= 200 && mouseY <= 220) { // 1P easy mode
        chooseMode = false;
        battleMode = false;
        chooseGame = false;

        useComputer = true; 
        difficulty = 0;
        playerHeight = 150;
        player1Y = height / 2 - 75;

        p2Skin = int(random(4)); // Randomly chooses a skin for computer
      }

      if (mouseX >= 270 && mouseX <= 430 && mouseY >= 240 && mouseY <= 260) { // 1P hard mode
        chooseMode = false;
        chooseGame = false;
        battleMode = false;

        useComputer = true;
        difficulty = 1;
        playerHeight = 100;
        player1Y = height / 2 - 50;

        p2Skin = int(random(4)); // Randomly chooses a skin for computer
      }

      if (mouseX >= 275 && mouseX <= 420 && mouseY >= 280 && mouseY <= 300) { // 2P mode
        chooseGame = false;
        battleMode = false;
        chooseMode = false;

        useComputer = false;
        playerHeight = 150;
        player1Y = height / 2 - 75;
      }
    }

    if (otherMode) {
      if (mouseX >= 270 && mouseX <= 430 && mouseY >= 200 && mouseY <= 220) { // Practice mode
        practice = true;
        useComputer = true;
        chooseMode = false;
        otherMode = false;
        chooseGame = false;

        practiceObstacleY = -120;
        practiceObstacleHeight = 120;
      }

      if (mouseX >= 280 && mouseX <= 420 && mouseY >= 240 && mouseY <= 260) { // Portal PvP mode
        useComputer = false;
        portalMode = true;
        chooseMode = false;
        otherMode = false;
        chooseGame = false;
      }

      if (mouseX >= 290 && mouseX <= 405 && mouseY >= 320 && mouseY <= 340) { // Changing usernames
        chooseMode = false;
        chooseGame = false;
        inputtingNames = true;
        otherMode = false;
      }
      
      if (mouseX >= 250 && mouseX <= 450 && mouseY >= 280 && mouseY <= 300) { // Inverse controls toggle
        if (!inverseControls) {
          inverseControls = true;
          inverseMode = "On";
        } else {
          inverseControls = false;
          inverseMode = "Off";
        }
      }
    }

    if (mouseX >= 10 && mouseX <= 60 && mouseY >= 90 && mouseY <= 102) { // Patch notes display
      patchNotes = true;
      chooseMode = false;
    }

    if (mouseX >= 260 && mouseX <= 320 && mouseY >= 520 && mouseY <= 530) { // Going to the previous page
      if (currentPage > 1) currentPage--;
    }

    if (mouseX >= 380 && mouseX <= 440 && mouseY >= 520 && mouseY <= 530) { // Going to the next page
      if (currentPage < 8) currentPage++;
    }

    if (mouseX >= 300 && mouseX <= 350 && mouseY >= 220 && mouseY <= 260 && titleBallLocation.y == 237.6) { // Makes the title ball bounce again
      titleBallLocation = new PVector(325, 100);
      titleBallVelocity = new PVector(0, 2);
      titleBallGravity = new PVector(0, 0.2);
    }
  }

  if (inputtingNames) { // If the program is displaying the usernames page
    if (mouseX >= 266 && mouseX <= 430 && mouseY >= 290 && mouseY <= 310 && !receivingP2Input) { // Changes P1 username
      receivingP1Input = true;
      p1Name = "";
    }

    if (mouseX >= 266 && mouseX <= 430 && mouseY >= 370 && mouseY <= 390 && !receivingP1Input) { // Changes P2 username
      receivingP2Input = true;
      p2Name = "";
    }

    if (mouseX >= 330 && mouseX <= 370 && mouseY >= 580 && mouseY <= 600 && !receivingP1Input && !receivingP2Input) { // Returns to homepage
      inputtingNames = false;
      chooseMode = true;
      chooseGame = false;
      battleMode = false;
      otherMode = false;

      starsR = 255;
      starsG = 0;
      starsB = 0;

      titleBallLocation = new PVector(325, 100); // Constructs three PVector objects for the ellipse drawn on the homepage
      titleBallVelocity = new PVector(0, 2);
      titleBallGravity = new PVector(0, 0.2);
    }
  }
}
