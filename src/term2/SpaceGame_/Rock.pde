class Rock {
  //member vars
  int x, y, diam, speed;
  PImage r1;

  //constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(20,60));
    speed = int(random(1, 5));
    r1 = loadImage("Rock.png");
  }


  void display() {
    r1.resize(diam,diam);
    image(r1, x, y);
  }


  void move() {
    y = y + speed;
  }


  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
