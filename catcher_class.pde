class Catcher {
  float speed;
  float catcherWidth, catcherHeight;
  float x, y;
  float score = 0;
  char control = 's';

  Catcher(float s, float w, float h) {
    speed = s;
    catcherWidth = w;
    catcherHeight = h;
    x = width/2;
    y = height - 30;
  }

  void display() {
    fill(100, 150, 255);
    rect(x, y, catcherWidth, catcherHeight);
  }

  void move() {
    if (control == 'z') x -= speed;
    if (control == 'x') x += speed;
    if (control == 's') { /* stop */ }

    x = constrain(x, catcherWidth/2, width - catcherWidth/2);
  }

  void checkCaught(Ball b) {
    if (b.y + b.ballWidth/2 >= y - catcherHeight/2 &&
        b.y - b.ballWidth/2 <= y + catcherHeight/2 &&
        b.x > x - catcherWidth/2 &&
        b.x < x + catcherWidth/2) {
      score++;
      b.resetBall();
    }
  }

  void setCatcherControl(char c) {
    control = c;
  }

  float getScore() {
    return score;
  }

  void resetScore() {
    score = 0;
  }
}
