//rainbow box matrix button
//assignment 3
//iml 288
//ruolan wu

int hcolor = 0;
int c = 12;
int r = 12;
int ct = 0;
float bSize;

void setup() {
  // 3d canvas
  size(600, 600,P3D);
  // hsb color
  colorMode(HSB, 360, 100, 100);
  // frame rate
  frameRate(24);
}

void draw() {

  // set up cube details
   if (mousePressed) {   
    background(360);
    lights();
    strokeWeight(0);
    fill(hcolor % 360);
    drawBoxGrid();
    
    fill(0,0,0);
    rectMode(CENTER);
    rect(mouseX,mouseY,200,100,100);
    textSize(24);
    textAlign(CENTER);
    fill(0,0,100);
    text("RELEASE", mouseX,mouseY+10);
    
  } else {    
    background(0);
    noFill();
    strokeWeight(1);
    stroke(hcolor % 360, 100, 100);
    drawBoxGrid();
    
    fill(0,0,100);
    rectMode(CENTER);
    rect(mouseX,mouseY,200,100,100);
    textSize(24);
    textAlign(CENTER);
    fill(0,0,0);
    text("CLICK AND HOLD", mouseX,mouseY+10);
  }
}

void drawBoxGrid() {
  
  //set variables
  float n = random(0.00001, 0.75);
  bSize = (min(width, height) / (float) max(c, r)) * n;
  
  // set mouse position
  PVector mousePos = new PVector(mouseX, mouseY, 500);
  
  // map x
  for (int xi = 0; xi < c; xi++) {
    float x = map(xi, 0, c - 1, 0, width);
    
    // hue per column
    int columnHue = (hcolor + xi * (360 / c)) % 360;

    // box facing mouse
    for (int yi = 0; yi < r; yi++) {
      float y = map(yi, 0, r - 1, 0, height);
      PVector boxPos = new PVector(x, y);
      PVector toMouse = PVector.sub(mousePos, boxPos);
      
      // box matrix
      pushMatrix();
      translate(boxPos.x, boxPos.y);
      rotate(PI, toMouse.x, toMouse.y, toMouse.z);
      
      // set stroke
      stroke(columnHue, 100, 100);
      box(bSize);
      
      // set color if loop
      if(ct%5==0)
      hcolor=hcolor+1;
    
    // set color interval
    ct=ct+1;
      
      popMatrix();
    }
  }
}
