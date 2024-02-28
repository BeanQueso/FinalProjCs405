//Eshaan Tripathi
//Rain Qu

import java.util.Arrays;
import java.util.HashSet;

ArrayList<Hexagon> selectedHexes = new ArrayList<Hexagon>();
boolean invalidMove = false;

int gridsize = 5;
int hexsize = 30;
Hexagon[] hexes = tilecoords(hexsize, gridsize);

void setup() {
  size(800, 800);
  background(200);
  for (int i = 0; i<hexes.length; i++) {
    System.out.println(hexes[i].q+" "+hexes[i].s+" "+hexes[i].r);
  }
}

void draw() {
  rendertile(hexes, hexsize);
}

public Hexagon[] tilecoords(float hexsize, int size) {
  ArrayList<Hexagon> hexes = new ArrayList<Hexagon>();
  for (int q = -size; q <= size; q++) {
    for (int r = -size; r <= size; r++) {
      int s = -q - r;
      if (Math.abs(q) <= size && Math.abs(r) <= size && Math.abs(s) <= size) {
        int tempN = (int)random(1, 4);
        hexes.add(new Hexagon(q, r, s, hexsize, tempN));
      }
    }
  }
  return hexes.toArray(new Hexagon[0]);
}

public void rendertile(Hexagon[] hexes, float hexsize) {

  stroke(0, 0, 0, 255);
  textAlign(CENTER);

  for (int i = 0; i < hexes.length; i++) {

    float x = width/2 + hexsize * sqrt(3) * (hexes[i].getq() + hexes[i].getr()/2.0);

    float y = height/2 + hexsize * 3/2 * hexes[i].getr();

    int[] sel = pixelToHex(hexsize);
    if (sel[0]==hexes[i].getq() && sel[1]==hexes[i].getr() && mousePressed && !selectedHexes.contains(hexes[i])) {
      if (selectedHexes.size() == 0) {
        selectedHexes.add(hexes[i]);
      } else if (selectedHexes.get(selectedHexes.size()-1).getn()!=hexes[i].getn()) {
        selectedHexes.add(hexes[i]);
        invalidMove = true;
      } else {
        selectedHexes.add(hexes[i]);
      }
    }

    colorMode(HSB, 360, 100, 100);
    float hue = hexes[i].getn() * 137.0 % 360.0; // this is intended, gives nice pastel while differentiating 1,2 and 3
    float saturation = hexes[i].getn() * 10 % 100.0;
    fill(hue, saturation, 100);
    
    colorMode(RGB, 255, 255, 255);
    
    if (selectedHexes.contains(hexes[i])) {
      fill(200);
    } else if (hexes[i].getq() == sel[0] && hexes[i].getr() == sel[1]) {
      stroke(255, 255, 255);
      fill(220);
    }

    hexes[i].render(x, y, hexsize);

    fill(0);
    stroke(0);
    //text(Integer.toString(hexes[i].getn()), x - hexsize/4, y - hexsize/4, hexsize/2, hexsize/2);
    text(hexes[i].getn()+"", x - hexsize/4, y - hexsize/4);
  }
}

void mouseDragged() {
}

void mouseReleased() {
  //clear selectedHexes, loop through selectedHexes to second-last element, add and set to last one
  println(selectedHexes.size());
  if (invalidMove == false) {
    selectedHexes.get(selectedHexes.size()-1).setn(selectedHexes.size()*selectedHexes.get(selectedHexes.size()-1).getn());
    for (int j = 0; j<selectedHexes.size(); j++) {
      if (j!=selectedHexes.size()-1) {
        selectedHexes.get(j).setn((int)random(1, 4));
      }
    }
  }
  selectedHexes.clear();
  invalidMove = false;
}

int[] pixelToHex(float hexsize) {
  float x = mouseX - width/2;
  float y = mouseY - height/2;
  float floatq = (sqrt(3)/3 * x  -  1.0/3 * y) / hexsize;
  float floatr = (2.0/3 * y) / hexsize;
  float floats = -floatq - floatr;

  int q = round(floatq);
  int r = round(floatr);
  int s = round(floats);

  float qdiff = abs(q - floatq);
  float rdiff = abs(r - floatr);
  float sdiff = abs(s - floats);

  if (qdiff > rdiff && qdiff > sdiff) {
    q = -r-s;
  } else if (rdiff > sdiff) {
    r = -q-s;
  } else {
    s = -q-r;
  }
  return new int[]{q, r};
}
