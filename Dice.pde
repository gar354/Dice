// feel free to change these!
int rows = 10;
int columns = 10;
float marginPercent = 0.1;
// dynamic variables
int diceLength;
int totalLength;
int margin;
int centerOffset;
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
  size(600, 600);
  // aspect ratio handling
  if (columns >= rows) {
    totalLength = width / (columns + 2);
  } else {
    totalLength = height / (rows + 2);
  }
  diceLength = (int)(totalLength * (1 - marginPercent));
  margin = (int)(totalLength * marginPercent);
  centerOffset = (width - (totalLength * columns)) / 2;
  noLoop();
}

void draw() {
  background(255);
  int total = 0;
  Die diceCube = new Die(0,0, diceLength);
  for (int y = 0; y < rows; y++) { // rows
    for (int x = 0; x < columns; x++) { // columns
      diceCube.x = x * totalLength + centerOffset;
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
