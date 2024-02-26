public class Hexagon {

private int q = 0;
private int s = 0;
private int r = 0;
private float hexsize = 0;
private int n = 0;

  public Hexagon (int q, int s,int r, float hexsize, int n) {
    this.q = q;
    this.s = s;
    this.r = r;
    this.hexsize = hexsize;
    this.n = n;
  }

  public int getq() {
    return this.q;
  }
  public int gets() {
    return this.s;
  }
  public int getr() {
    return this.r;
  }

  public float gethexsize() {
    return this.hexsize;
  }

  public int getdoublecoordcol() {
    return this.q;
  }

  public int getdoublecoordrow() {
    return 2*this.r + this.q;
  }

  public void render(float x, float y, float size) {
    float angle = TWO_PI / 6;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * size;
      float sy = y + sin(a) * size;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
