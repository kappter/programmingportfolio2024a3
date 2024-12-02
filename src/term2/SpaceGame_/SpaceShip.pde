class SpaceShip {
  //member vars
  int x, y, w, health, laserCount, turretCount, level;

  //constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
    level =1;
  }


  void display() {
    rectMode(CORNER);
    stroke(100, 75, 0);
    strokeWeight(1);
    fill(50, 50, 100);
    rect(x-15, y-30, 30, 60);
    fill(100, 100, 200);
    triangle(x-15, y-30, x, y-60, x+15, y-30);
    fill(200, 50, 50);
    triangle(x-15, y, x-15, y+30, x-30, y+30);
    triangle(x+15, y, x+15, y+30, x+30, y+30);
  }


  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }


  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }
  
  
  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if(d < 50){
    return true;
    }else{
      return false;
    }
  }
}
