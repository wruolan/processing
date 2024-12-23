// snake blep (now with butterflies!)
// assignment 1
// iml 288
// ruolan wu

float angle = 0;
float amplitude = 50;
float frequency = 0.1;
float bugSize = 20;

PVector[] previous_mouse_positions = new PVector[20];
PVector[] butterfly1_positions = new PVector[20];
PVector[] butterfly2_positions = new PVector[20];
int index = 0;

void setup() {
  size(600, 600);
  frameRate(9);
  smooth();
  
  for (int i = 0; i < previous_mouse_positions.length; i++) {
    previous_mouse_positions[i] = new PVector(mouseX, mouseY);
    butterfly1_positions[i] = new PVector(mouseX, mouseY);
    butterfly2_positions[i] = new PVector(mouseX, mouseY);
  }
}

void draw() {
  background(157, 156, 133);
  float bugX = previous_mouse_positions[index].x;
  float bugY = previous_mouse_positions[index].y + sin(angle) * amplitude;

  butterfly(bugX, bugY);
  snek();
  
  float butterfly1X = butterfly1_positions[index].x;
  float butterfly1Y = butterfly1_positions[index].y + sin(angle + 0.5) * amplitude;
  butterfly(butterfly1X, butterfly1Y);

  float butterfly2X = butterfly2_positions[index].x;
  float butterfly2Y = butterfly2_positions[index].y + sin(angle + 1.0) * amplitude;
  butterfly(butterfly2X, butterfly2Y);

  angle += frequency;
  update_mouse_position();
}

void snek() {
  // body
  fill(201, 183, 156);
  rect(mouseX - 40, mouseY, 80, 1000 - mouseY, 30);
  fill(241, 224, 197);
  rect(mouseX - 25, mouseY + 40, 50, 600 - mouseY, 30);

  // head
  fill(241, 224, 197);
  rect(mouseX - 60, mouseY - 40, 120, 100, 300, 300, 300, 300);

  // irises
  fill(113, 129, 109);
  ellipse(mouseX - 30, mouseY, 10, 20);
  ellipse(mouseX + 30, mouseY, 10, 20);
  
  // pupils
  fill(52, 42, 33);
  strokeWeight(0);
  ellipse(mouseX - 30, mouseY, 2, 20);
  ellipse(mouseX + 30, mouseY, 2, 20);
  
  // tongue
  fill(230, 154, 168);
  stroke(0);
  triangle(mouseX, mouseY + 20, mouseX - 4, mouseY + 55, mouseX + 4, mouseY + 55);
  
  fill(241, 224, 197);
  stroke(241, 224, 197);
  strokeWeight(1);
  triangle(mouseX, mouseY + 45, mouseX - 4, mouseY + 55, mouseX + 4, mouseY + 55);
  
  // mouth
  noFill();
  stroke(0);
  strokeWeight(3);
  curve(mouseX - 15, mouseY - 125, mouseX - 35, mouseY + 20, mouseX, mouseY + 20, mouseX - 15, mouseY - 125);
  curve(mouseX + 25, mouseY - 125, mouseX + 35, mouseY + 20, mouseX, mouseY + 20, mouseX + 25, mouseY - 125);
}

void leaves() {
  // leaves
  rotate(radians(random(60)));
  fill(113, 129, 109);
  
  for (int i = 0; i < 9; i++) {
    ellipse(random(600), random(600), 50, 20);
  }
}

void butterfly(float x, float y) {
  fill(230, 154, 168, 200);
  beginShape();
  vertex(x, y);
  bezierVertex(x - 50, y - 90, x - 50, y + 90, x, y);
  bezierVertex(x - 30, y - 50, x - 30, y + 50, x, y);
  endShape(CLOSE);
  beginShape();
  vertex(x, y);
  bezierVertex(x + 50, y - 90, x + 50, y + 90, x, y);
  bezierVertex(x + 30, y - 50, x + 30, y + 50, x, y);
  endShape(CLOSE);
  
  fill(0);
  ellipse(x, y, 5, 30);
}

void update_mouse_position() {
  previous_mouse_positions[index] = new PVector(mouseX, mouseY);
  butterfly1_positions[index] = new PVector(previous_mouse_positions[(index + 5) % previous_mouse_positions.length].x, previous_mouse_positions[(index + 5) % previous_mouse_positions.length].y);
  butterfly2_positions[index] = new PVector(previous_mouse_positions[(index + 10) % previous_mouse_positions.length].x, previous_mouse_positions[(index + 10) % previous_mouse_positions.length].y);
  index = (index + 1) % previous_mouse_positions.length; 
}
