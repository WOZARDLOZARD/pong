class UserNames {
  void inputP1Name() {
    if (keyCode == BACKSPACE || keyCode == DELETE) {
      if (p1Name.length() > 0) p1Name = p1Name.substring(0, p1Name.length() - 1);
      
      return;
    }
    
    if (keyCode == SHIFT) return;
    
    if (p1Name.length() < 12) {
      if (p1Name == "I") {
        p1Name = "";
        p1Name += key;
      } else p1Name += key;
    }
  }
  
  void inputP2Name() {
    if (keyCode == BACKSPACE || keyCode == DELETE) {
      if (p2Name.length() > 0) p2Name = p2Name.substring(0, p2Name.length() - 1);
      
      return;
    }
    
    if (p2Name.length() < 12) {
      if (p2Name == "I") {
        p2Name = "";
        p2Name += key;
      } else p2Name += key;
    }
  }
  
  void display() {
    if (receivingP1Input) {
      fill(255);
      noStroke();
      
      beginShape();
      vertex(240, 290);
      vertex(250, 300);
      vertex(240, 310);
      endShape();
    } else if (receivingP2Input) {
      fill(255);
      noStroke();
      
      beginShape();
      vertex(240, 370);
      vertex(250, 380);
      vertex(240, 390);
      endShape();
    }
    
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
    
    
    textAlign(CENTER);
    fill(255);
    noStroke();
    
    textSize(40);
    text("Usernames", width / 2, 60);
    
    textSize(22);
    text("Input a friendly username below!", width / 2, 120);
    
    textSize(30);
    if (!receivingP1Input && !receivingP2Input) text("OK", width / 2, height - 100);
    
    textSize(24);
    if (p1Name.length() == 0 && receivingP1Input) text("I", width / 2, height / 2 - 40);
    if (p2Name.length() == 0 && receivingP2Input) text("I", width / 2, height / 2 + 40);
    
    if (p1Name == "" && !receivingP1Input) {
      text("Player 1 name", width / 2, height / 2 - 40);
    } else if (p1Name != "") {
      text(p1Name, width / 2, height / 2 - 40);
    } 
    
    if (p2Name == "" && !receivingP2Input) {
      text("Player 2 name", width / 2, height / 2 + 40);
    } else if (p2Name != "") {
      text(p2Name, width / 2, height / 2 + 40);
    } 
  } 
  
  void censor() {
    if (p1Name.toLowerCase().startsWith("nigger") || p1Name.toLowerCase().startsWith("bitch") || p1Name.toLowerCase().startsWith("asshole") || p1Name.toLowerCase().startsWith("dick") || p1Name.toLowerCase().startsWith("cunt") || p1Name.toLowerCase().startsWith("fag") || p1Name.toLowerCase().startsWith("penis") || p1Name.toLowerCase().startsWith("vagina") || p1Name.toLowerCase().endsWith("nigger") || p1Name.toLowerCase().endsWith("bitch") || p1Name.toLowerCase().endsWith("asshole") || p1Name.toLowerCase().endsWith("dick") || p1Name.toLowerCase().endsWith("cunt") || p1Name.toLowerCase().endsWith("fag") || p1Name.toLowerCase().endsWith("penis") || p1Name.toLowerCase().endsWith("vagina")) {
      randomName = int(random(randomNames.length));
      
      if (randomName == 1) {
        guestNumber = int(random(1000, 10000));
        p1Name = "Guest_" + guestNumber;
      } else p1Name = randomNames[randomName];
    }
    
    if (p2Name.toLowerCase().startsWith("nigger") || p2Name.toLowerCase().startsWith("bitch") || p2Name.toLowerCase().startsWith("asshole") || p1Name.toLowerCase().startsWith("dick") || p2Name.toLowerCase().startsWith("cunt") || p2Name.toLowerCase().startsWith("fag") || p2Name.toLowerCase().startsWith("penis") || p2Name.toLowerCase().startsWith("vagina") || p2Name.toLowerCase().endsWith("nigger") || p2Name.toLowerCase().endsWith("bitch") || p2Name.toLowerCase().endsWith("asshole") || p2Name.toLowerCase().endsWith("dick") || p2Name.toLowerCase().endsWith("cunt") || p2Name.toLowerCase().endsWith("fag") || p2Name.toLowerCase().endsWith("penis") || p2Name.toLowerCase().endsWith("vagina")) {
      randomName = int(random(randomNames.length));
      
      if (randomName == 1) {
        guestNumber = int(random(1000, 10000));
        p2Name = "Guest_" + guestNumber;
      } else p2Name = randomNames[randomName];
    }
  }
}
