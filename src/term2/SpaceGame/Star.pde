class Star {
  // Member Variables
  int x, y, diam, speed;

  // Constructor
  Star() {
    x = int(random(width));
    y = -10;
    diam = int(random(1, 4));
    speed = int(random(1, 6));
  }

  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }


  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 10) {
      return true;
    } else {
      return false;
    }
  }
}
