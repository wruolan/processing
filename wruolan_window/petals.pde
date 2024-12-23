void petals() {
  frameRate(9);
  background(219, 186, 230);

  color skyColor = color(255, 230, 251);
  color groundColor = color(245, 207, 255);

  drawGradient(0, 100, width, 900, skyColor, groundColor);
  noStroke();

  for (int i = 0; i < 45; i++) {
    float x = random(200, 800);
    float y = random(100, 900);
    float size = random(10, 30);
    float w = size;
    float h = size * 1.25;
    float angle = random(TWO_PI);

    fill(random(200, 255), random(150, 200), random(200, 220));

    pushMatrix();
    translate(x, y);
    rotate(angle);
    petal(0, 0, w, h);
    popMatrix();
  }
}

void petal(float x, float y, float w, float h) {
  beginShape();
  vertex(x, y);
  quadraticVertex(x - w / 2, y - h / 2, x, y - h);
  quadraticVertex(x + w / 2, y - h / 2, x, y);
  endShape(CLOSE);
}
