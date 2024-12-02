class Powerup {
  //member vars
  int x, y, diam, speed;
  char type;
  PImage p1;


  //constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(20,60));
    speed = int(random(1, 5));
    int rand = int(random(2));
    if(rand == 0){
      type = 'h';
    }else if(rand == 1){
      type = 'a';
    }
  }


  void display() {
    if (type == 'h'){
    p1 = loadImage("PowUpP.png");
    }
    else if(type =='a'){
      p1 = loadImage("PowUpG.png");
    }
    p1.resize(diam,diam);
    image(p1, x, y);
  }


  void move() {
    y = y + speed;
  }
  
  
boolean intersect(SpaceShip s) {
    float d = dist(s.x, s.y, x, y);
    if(d<50){
    return true;
    }else{
      return false;
    }
  }
  
  
  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
