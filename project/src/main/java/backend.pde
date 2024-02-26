public Hexagon[] tilecoords(float hexsize, int size) {
    Hexagon[] hexes = new Hexagon[1 + (size - 1) * 6];
    int i = 0;
    for (int q = 0; q >= -size; q--) {
      for(int r = -size - q; r < size; r++) {
        hexes[i] = new Hexagon(q, r, -q-r, hexsize, 0);
        i++;
      }
    }
    for (int q = 1; q <= size; q++) {
      for(int r = -size; r < size - q; r++) {
        hexes[i] = new Hexagon(q, r, -q-r, hexsize, 0);
        i++;
      }
    }
    return hexes;
} 

public void rendertile(Hexagon[] hexes, float size) {
  for (int i = 0; i < hexes.length; i++) {
    float x = width/2 + ((3 * size)/2) * hexes[i].getq();
    float y = height/2 + (hexes[i].getr() * sqrt(3) * size) + (hexes[i].getq() * (sqrt(3) * size / 2));
    hexes[i].render(x, y, hexes[i].gethexsize());
  }
}

void setup() {
  size(640, 480);
}

void draw() {
  rendertile(tilecoords(30, 5), 5);
}
