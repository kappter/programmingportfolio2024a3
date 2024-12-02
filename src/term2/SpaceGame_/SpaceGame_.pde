//Ava Baskin | Nov 6 2024 | Space Game

import processing.sound.*;

//variable creation
int score, rockCount, level, rockTime;
Boolean play;
SpaceShip s1;
Timer puTime, rTime;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
SoundFile laser1;


void setup() {
  size(800, 800);
  laser1 = new SoundFile(this, "laser2.wav");
  s1 = new SpaceShip();
  rockTime = 1000;
  rTime = new Timer(rockTime);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
  play = false;
  level = 1;
}


void draw() {
  if (!play) {
    startScreen();
  } else {
    if(frameCount % 1000 == 0){
      level ++;
      rockTime-=50;
    }
    noCursor();
    background(0);

    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);

    //powerup logic
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type == 'h') {
          s1.health += pu.diam/2;
        } else if (pu.type == 'a') {
          s1.laserCount += pu.diam/2;
        }
        powups.remove(pu);
      }
    }

    //rock logic
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock) && s1.health > 0) {
        s1.health -= rock.diam;
        rocks.remove(rock);
        score += rock.diam;
      } else if (s1.intersect(rock)) {
        while (s1.health<0) {
          gameOver();
        }
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }

    //laser intersect logic
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          rocks.remove(r);
          lasers.remove(laser);
          score += r.diam;
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
    //if (score % 1000 ==0){
      //level ++;
   // }
  }
}

//add laser
void keyPressed() {
  if (key==' ' && s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount --;
    laser1.play();
  }
}

//infopanel
void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("Score:" + score, 20, 35);
  text("Health:" + s1.health, 240, 35);
  text("ammo:" + s1.laserCount, 375, 35);
  text("turretCount:" + s1.turretCount, 515, 35);
  text("level:" + level, 715, 35);
}

//start screen
void startScreen() {
  background(0);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Welcome to Space Game", width/2, 300);
  text("Click to start", width/2, 350);
  if (mousePressed) {
    play = true;
  }
}

//gameover
void gameOver() {
  textAlign(CENTER);
  background(0);
  fill(255);
  textSize(30);
  text("Game over", width/2, 300);
  text("Score: " + score +"   level: " +level, width/2, 350);
}

//ticker
void ticker() {
}


void mousePressed() {
  if (key==' ' && s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount --;
    laser1.play();
  }
}
