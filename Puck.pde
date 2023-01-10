class Puck {
  float x = width/2;
  float y = height/2;
  ;
  float xspeed =4;
  float yspeed = 5;
  float r = 10;

  Puck() {
    reset();
  }
  //Checks what happens when the paddle hits the left paddle

  void checkMiddlePaddle (Paddle p) {
    if (y + r > p.y - p.h/2 && x + r > p.x - p.w/2 && x - r < p.x + p.w/2) {
      float diff = x - (p.x - p.w/2);
      float rad = radians(45);
      float angle = map (diff, 0, p.w, -rad, rad);
      xspeed = 4  * sin(angle);
      yspeed *= -1;
      c = color(random(0, 255), random(0, 255), random(0, 255)); // Sets it to a random color
    }
  }
  
  void middleHitBox(Box b){
    
    if(y - r < b.ycord + b.h/2 && y + r > b.ycord - b.h/2 &&  x + r > b.xcord - b.w/2 && x - r < b.xcord + b.w/2){
      yspeed *=-1;
      b.destroy(b);
      middlescore++;
  }
  }

  void update () { //Continuously updates the pong and moves it.
    x = x + xspeed;
    y = y + yspeed;
  }

  void reset() { // Resets it back at the center and sends it at a random direction.
    x = width/2;
    y = height/2;
    float angle = random (PI/2, PI);
    xspeed = 4 * cos (angle);
  }


  void edges() { // Sends it in the opposite direction if it hits the up and left and right edges''

    if (x > width - r ) {
     xspeed *= - 1;
    }
    if ( x < r) {
      xspeed *= -1;
    }

    //Up
    if (y < 0 + r) {
      yspeed *= - 1;
    }
    if (y > height - r) {
      gameScreen = 2;
    }
  }

  void show() {
    fill(c);
    rect (x, y, r*2, r*2);
  }
}
