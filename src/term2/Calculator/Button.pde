class Button {
  // Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, color c1, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    c2 = color(120);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
