class Ball {
  float speed;
  float ballWidth;
  float x, y;

  Ball(float s, float w) {
    speed = s;
    ballWidth = w;
    resetBall();
  }

  void display() {
    fill(255, 100, 100);
    ellipse(x, y, ballWidth, ballWidth);
  }

  void move() {
    y += speed;
  }

  void resetBall() {
    x = random(ballWidth/2, width - ballWidth/2);
    y = -ballWidth;
  }
}


  



  
