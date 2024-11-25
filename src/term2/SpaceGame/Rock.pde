class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -200;
    diam = int(random(20,75));
    speed = int(random(1,5));
    r1 = loadImage("rock1.png");
  }

  void display() {
    r1.resize(diam,diam);
    image(r1,x,y);
  }

  void move() {
    y = y + speed;
  }
  
  boolean reachedBottom() {
    if(y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
