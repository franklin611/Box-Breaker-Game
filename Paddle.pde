class Paddle { //Creates the paddle class.
  float x;
  float y = height - 15;
  float w = 80;
  float h = 15;


  float xchange = 0;

  Paddle() {
    x = width/2;
  }

  void update() {
    x += xchange;
    x = constrain (x, w/2, width - w/2);
  }

  void move (float steps) { //Moves the paddle.
    xchange = steps;
  }

  void show() {
    fill(c);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
