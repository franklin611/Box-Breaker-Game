Puck puck;
Paddle left;
Paddle right;
Paddle middle;
Box box1;

int middlescore = 0;
int gameScreen = 0;
color c = color(random(0, 255), random(0, 255), random(0, 255));

void setup () {
  size (600, 400);
  puck = new Puck();
  middle = new Paddle ();
  box1 = new Box();
  
}


void initScreen() { //Background
  //  Create a keypressed such that the game starts when the user clicks the space bar.
  background(0);
  textSize(32);
  textAlign(CENTER);
  text("Welcome to Box Breaker. Press Space to start", width/2, height/2);
  textSize(16);
  text("Hit the Box :D.", width/2, height/2 + 32);
  text("Created by: Franklin R", width/2, height/2 + 48);
}

void loseScreen() {
  background(0);
  textSize(64);
  textAlign(CENTER);
  text("YOU LOST", width/2, height/2);
  textSize(32);
  text("SCORE: " + middlescore + ".", width/2, height/2 + 32);
  text("Press Space to retry.", width/2, height/2 + 64);
}

void draw () {
  if (gameScreen == 0) { //Set it initially to gameScreen = 0. When spacebar is pressed, will set gameScreen to 1 and start the game.
    initScreen();
  } else if (gameScreen == 1) {
    gameScene();
  } else if (gameScreen == 2) {
    loseScreen();
  }
}

void gameScene() {
  background(0);
  

  puck.checkMiddlePaddle(middle);
  puck.middleHitBox(box1);
  
  box1.create();


  middle.show();
  middle.update();

  puck.edges();
  puck.update();
  puck.show();

  //Creates the scores
  fill(c);
  textSize(36);
  text(middlescore, width/2, 40);
}

void restart(){
  middlescore = 0;
  gameScreen = 0;
  puck.reset();
  box1.newBox();
  box1.create();
  
  
}



//After the key is released, stops moving the paddles.
void keyReleased() {
  middle.move(0);
}

void keyPressed() {
  if (key == ' ' && (gameScreen == 1 || gameScreen == 0)) {
    gameScreen = 1;
  }
  
  if(key == ' ' && gameScreen == 2){
   restart();
   
   
  }
  //Controls for the  paddle.
  if (key == CODED) {
    if (keyCode == RIGHT) {
      middle.move(10);
    } else if (keyCode == LEFT) {
      middle.move(-10);
    }
  }
}
