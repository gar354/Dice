class Die //models one single dice cube
{
  int r, g, b, a;
  int sides = 6;
  int currentSide;
  int x, y;
  int size;
  
  Die(int x1, int y1, int size1) {
    roll();
    x = x1;
    y = y1;
    size = size1;
  }
  void roll() {
    currentSide = (int)linear_interpolate((double)1, (double)sides + 1, Math.random());
  }
  void show() {
    System.out.print(currentSide);
    fill(255);
    rect(x, y, size, size);
    fill(0);
    textAlign(CENTER);
    textSize(size);
    text(currentSide, x + size / 2, y + size - (size / 8));
  }
}
