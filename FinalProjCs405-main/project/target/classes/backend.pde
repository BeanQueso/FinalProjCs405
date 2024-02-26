import java.util.Arrays;

public Hexagon[] tilecoords(float hexsize, int size) {
  ArrayList<Hexagon> hexes = new ArrayList<Hexagon>();
  for (int q = -size; q <= size; q++) {
    for (int r = -size; r <= size; r++) {
      int s = -q - r;
      if (Math.abs(q) <= size && Math.abs(r) <= size && Math.abs(s) <= size) {
        int tempN = (int)random(1,4);
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

    hexes[i].render(x, y, hexsize);
    
    fill(0, 0, 0);
    text(Integer.toString(hexes[i].getn()), x - hexsize/4, y - hexsize/4, hexsize/2, hexsize/2);
  }
}

int[] pixelToHex(float hexsize){
  int q = round((sqrt(3)/3 * mouseX  -  1/3 * mouseY) / hexsize);
  int r = round((2/3 * mouseY) / hexsize);
  return new int[]{q,r};
}

int gridsize = 5;
int hexsize = 30;
Hexagon[] hexes = tilecoords(hexsize, gridsize);


void setup() {
  
  size(800, 800);
  background(200);
  for(int i = 0; i<hexes.length; i++){
    System.out.println(hexes[i].q+" "+hexes[i].s+" "+hexes[i].r);
  }
}

void draw(){
  rendertile(hexes, hexsize);
  System.out.println(Arrays.toString(pixelToHex(hexsize)));
}