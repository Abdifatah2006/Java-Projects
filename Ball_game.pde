Ball ball1;
Ball ball2;
Catcher catcher;

int lives = 3;        // Number of lives
boolean gameOver = false;  // Game over state

void setup() {
  size(800, 600);
  rectMode(CENTER);

  ball1 = new Ball(2, 30);
  ball2 = new Ball(3, 25);

  catcher = new Catcher(4, 140, 20);
}

void draw() {
  background(200);

  if (!gameOver) {
    showScore();
    showLives();

    ball1.display();
    ball1.move();
    ball2.display();
    ball2.move();

    catcher.display();
    catcher.move();

    // Check if caught, otherwise lose life
    catcher.checkCaught(ball1);
    catcher.checkCaught(ball2);

    // Check if ball missed catcher
    checkMissed(ball1);
    checkMissed(ball2);
  } else {
    showGameOver();
  }
}

void showScore() {
  fill(0);
  textSize(20);
  float theScore = catcher.getScore();
  text("Score: " + theScore, 10, 50);
}

void showLives() {
  fill(0);
  textSize(20);
  text("Lives: " + lives, width - 100, 50);
}

void checkMissed(Ball b) {
  if (b.y - b.ballWidth / 2 > height) { // Ball goes off screen
    lives--;
    b.resetBall(); // Reset ball position
    if (lives <= 0) {
      gameOver = true;
    }
  }
}

void showGameOver() {
  background(0, 0, 0, 150);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("GAME OVER!", width/2, height/2 - 40);
  textSize(24);
  fill(255);
  text("Press R to Restart", width/2, height/2 + 20);
}

void keyPressed() {
  if (!gameOver) {
    if (key == 'z' || key == 'x' || key == 's') {
      catcher.setCatcherControl(key);
    }
  } else {
    if (key == 'r' || key == 'R') {
      restartGame();
    }
  }
}

void restartGame() {
  lives = 3;
  catcher.resetScore();
  ball1.resetBall();
  ball2.resetBall();
  gameOver = false;
}
