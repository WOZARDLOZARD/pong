class PatchNotes {
  void display() {
    fill(255);
    noStroke();
    textAlign(CENTER);

    textSize(40);
    text("Patch Notes", width / 2, 56);

    textSize(20);
    text("Click anywhere onscreen to return to the homepage.", width / 2, 90);

    textAlign(LEFT);
    textSize(22);
    text("Current version | November 20, 2019", 20, 140);

    textSize(16);
    text("* The ball will now launch at slightly faster speeds.\n" +
    "* The homepage UI has been redesigned.\n" +
    "* Lag issues have been addressed, but may persist.\n" + 
    "* Skins have been added for the players.\n" + 
    "* Powerups have been added to practice mode.\n" + 
    "* Paddle controls can now be reversed using a toggle on the homepage.\n" + 
    "* Paddles now have colored borders.\n" + 
    "* Color has been added to the difficulty bars.\n" + 
    "* Player scores will be now hidden when the game has started.\n" + 
    "* Custom usernames can now be set.\n" + 
    "* Username input has been refined.\n" + 
    "* Lag issues have been addressed, but may still persist."
    , 20, 170);
  }
}
