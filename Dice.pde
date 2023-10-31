// feel free to change these!
int rows = 10;
int columns = 10;
int diceLength = 100;
int margin = 10;
// dynamic variables
int totalLength;

// substitutions for already available processing functions
double distance(double x1, double y1, double x2, double y2) {
  double xDiff = x1 - x2;
  double yDiff = y1 - y2;
  return Math.sqrt(xDiff * xDiff + yDiff * yDiff);
}

double linear_interpolate(double x1, double x2, double weight) {
  return (1 - weight) * x1 + weight * x2;
}
// ---


void setup() {
  totalLength = diceLength + margin;
  int xSize = totalLength * columns;
  int ySize = totalLength * (rows + 2);
  surface.setSize(xSize, ySize);
  noLoop();
}
void draw() {
  background(255);
  int total = 0;
  Die diceCube = new Die(0,0, diceLength);
  for (int y = 0; y < rows; y++) { // rows
    for (int x = 0; x < columns; x++) { // columns
      diceCube.x = x * totalLength + margin / 2;
      diceCube.y = y * totalLength + margin / 2;
      diceCube.roll();
      diceCube.show();
      total += diceCube.currentSide;
    }
    System.out.println();
  }
  textSize(diceLength);
  fill(0);
  textAlign(CENTER);
  text("total:" + total, width / 2, (rows + 1) * totalLength);
  System.out.println(columns * totalLength);
  System.out.println(rows * totalLength);

}

void mousePressed() {
  redraw();
}
