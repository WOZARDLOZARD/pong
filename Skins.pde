class Skins {
  void display() {
    stroke(255);
    strokeWeight(3);

    if (p1Skin == 1) {
      fill(66, 135, 245);
      
      ellipse(51, player1Y - 12, 18, 18);
      ellipse(51, player1Y + playerHeight + 12, 18, 18);
    } else if (p1Skin == 2) {
      fill(66, 135, 245);
      
      triangle(40, player1Y - 6, 63, player1Y - 6, 51, player1Y - 22);
      triangle(40, player1Y + playerHeight + 6, 63, player1Y + playerHeight + 6, 51, player1Y + playerHeight + 22);
    } else if (p1Skin == 3) {
      fill(66, 135, 245);
      
      beginShape(); // Top diamond
      vertex(51, player1Y - 25);
      vertex(40, player1Y - 14);
      vertex(51, player1Y - 3);
      vertex(62, player1Y - 14);
      vertex(51, player1Y - 25);
      endShape();

      beginShape(); // Bottom diamond
      vertex(51, player1Y + playerHeight + 25);
      vertex(40, player1Y + playerHeight + 14);
      vertex(51, player1Y + playerHeight + 3);
      vertex(62, player1Y + playerHeight + 14);
      vertex(51, player1Y + playerHeight + 25);
      endShape();
    }

    if (p2Skin == 1) {
      fill(232, 0, 0);
      
      ellipse(649, player2Y - 12, 18, 18);
      ellipse(649, player2Y + 150 + 12, 18, 18);
    } else if (p2Skin == 2) {
      fill(232, 0, 0);
      
      triangle(width - 62, player2Y - 6, width - 62 + 22, player2Y - 6, width - 62 + 11, player2Y - 22);
      triangle(width - 62, player2Y + 150 + 6, width - 62 + 22, player2Y + 150 + 6, width - 62 + 11, player2Y + 150 + 22);
    } else if (p2Skin == 3) {
      fill(232, 0, 0);
      
      beginShape(); // Top diamond
      vertex(width - 62 + 11, player2Y - 25);
      vertex(width - 62, player2Y - 14);
      vertex(width - 62 + 11, player2Y - 3);
      vertex(width - 62 + 22, player2Y - 14);
      vertex(width - 62 + 11, player2Y - 25);
      endShape();

      beginShape(); // Bottom diamond
      vertex(width - 62 + 11, player2Y + 150 + 25);
      vertex(width - 62, player2Y + 150 + 14);
      vertex(width - 62 + 11, player2Y + 150 + 3);
      vertex(width - 62 + 22, player2Y + 150 + 14);
      vertex(width - 62 + 11, player2Y + 150 + 25);
      endShape();
    }
  }

  void p1Change() {
    if (p1Skin < 3) {
      p1Skin++;
      return;
    }

    if (p1Skin == 3) p1Skin = 0;
  }

  void p2Change() {
    if (p2Skin < 3) {
      p2Skin++;
      return;
    }

    if (p2Skin == 3) p2Skin = 0;
  }
}
