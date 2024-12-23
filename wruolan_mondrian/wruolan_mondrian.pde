// abstract expressionist generator
// assignment 5
// iml 288
// ruolan wu

int cols = 6; 
int rows = 6; 
int lineThickness = 6;
color[] colors = {color(255, 0, 0), color(0, 0, 255), color(255, 255, 0), color(255), color(0)};

void setup() {
  size(600, 600);
  background(255);
  frameRate(2);
}

void draw() {
  drawMondrian();
}

void drawMondrian() {
  int currentX = 0;
  int currentY = 0;
  
  // rectangle width
  for (int i = 0; i < cols; i++) {
    int rectWidth = int(random(50, 200));
    currentY = 0;
    
    // draw rectangle
    for (int j = 0; j < rows; j++) {
      int rectHeight = int(random(50, 200));
      fill(randomColor());
      noStroke();
      rect(currentX, currentY, rectWidth, rectHeight);
      
      // bottom outline
      fill(0);
      rect(currentX, currentY + rectHeight, rectWidth, lineThickness);
      rect(currentX + rectWidth, 0, lineThickness, height);
      
  // update currentY and currentX
  currentY += rectHeight + lineThickness;
  }  
  currentX += rectWidth + lineThickness;
  }
}

// random color
color randomColor() {
  return colors[int(random(colors.length))];
}
