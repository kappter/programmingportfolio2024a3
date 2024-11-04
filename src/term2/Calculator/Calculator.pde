// Mr Kapptie | Calc Project | 2 Oct 2024
Button[] buttons = new Button[17];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(310, 310);
  background(50);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(65, 280, 110, 50, color(155), "0", true);
  buttons[1] = new Button(35, 220, 50, 50, color(155), "1", true);
  buttons[2] = new Button(95, 220, 50, 50, color(155), "2", true);
  buttons[3] = new Button(155, 220, 50, 50, color(155), "3", true);
  buttons[4] = new Button(35, 160, 50, 50, color(155), "4", true);
  buttons[5] = new Button(95, 160, 50, 50, color(155), "5", true);
  buttons[6] = new Button(155, 160, 50, 50, color(155), "6", true);
  buttons[7] = new Button(35, 100, 50, 50, color(155), "7", true);
  buttons[8] = new Button(95, 100, 50, 50, color(155), "8", true);
  buttons[9] = new Button(155, 100, 50, 50, color(155), "9", true);
  buttons[10] = new Button(245, 100, 105, 50, color(120), "C", false);
  buttons[11] = new Button(155, 280, 50, 50, color(155), ".", false);
  buttons[12] = new Button(215, 220, 50, 50, color(155), "+", false);
  buttons[13] = new Button(215, 280, 50, 50, color(155), "xⁱ", false);
  buttons[14] = new Button(275, 280, 50, 50, color(155), "/", false);
  buttons[15] = new Button(275, 220, 50, 50, color(155), "x", false);
  buttons[16] = new Button(245, 160, 105, 50, color(155), "=", false);
}

void draw() {
  background(50);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left);
}

void updateDisplay() {
  rectMode(CENTER);
  fill(222);
  rect(width/2, 35, 290, 50);
  fill(0);
  if (dVal.length()<12) {
    textSize(40);
  } else if (dVal.length() == 12) {
    textSize(35);
  } else if (dVal.length() == 13) {
    textSize(30);
  }
  textAlign(RIGHT);
  text(dVal, width-55, 45);
}

void mouseReleased() {
  for (int i=0; i<buttons.length; i++) {
    // Setting numbers left of the operator
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<20) {
      dVal += buttons[i].val;
      l = float(dVal);
      // Setting numbers left of the operator
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length()<20) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      // Decimal
      handleEvent(".", false);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      op = '-';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      op = '*';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("/")) {
      op = '/';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("xⁱ")) {
      op = 'e';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && buttons[i].val.equals("Del")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left) {
        r = PI;
        dVal = str(r);
      }
    }
  }
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'e') {
    result = pow(l, r);
  }
  dVal = str(result);
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48 ) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97 ) {
    handleEvent("1", true);
  } else if (key == '+' || keyCode == 107 ) {
    handleEvent("+", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals(".") && !isNum) {
    if (left) {
      if (!dVal.contains(".")) {
        dVal += keyVal;
        l = float(dVal);
      } else if (!dVal.contains(".")) {
        dVal += keyVal;
        r = float(dVal);
      }
    }
  }
}
