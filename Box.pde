class Box {
  float xcord = width/2;
  float ycord = height/2;

  float w = 100;
  float h = 25;

  Box() {
    create();
  }

  void newBox() {
    xcord = random (w, width - h);
    ycord = random (100, height/2 + 50);
    create();
  }
  
  void destroy(Box x){
    x.xcord = -10000;
    x.ycord = -10000;
    newBox();
    create();
    
    
  }
  
    

  void create() {
    fill(255);
    rectMode(CENTER);
    rect(xcord, ycord, w, h);
  }
}
