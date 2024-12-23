void drawGradient(float x, float y, float w, float h, color c1, color c2) {
  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h, 0, 1); // Interpolation factor from 0 to 1
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}

void rain() {
  frameRate(30);
  background(40, 40, 80);

  color skyColor = color(50, 50, 90);  // Sky color
  color groundColor = color(10, 10, 30);  // Ground color

  drawGradient(0, 680, width, height - 680, skyColor, groundColor); // Gradient from sky to ground

  angle += 0.05; // Increment the angle for rotation of raindrops
  noStroke();

  // Draw raindrops
  for (int i = 0; i < 1000; i++) {
    float x = random(width);  // Random horizontal position
    float y = random(height);  // Random vertical position
    float w = random(1, 5);    // Random width of raindrop
    float h = random(20, 60);  // Random height of raindrop
    float maxRotation = radians(random(15, 30));
    float rotation = map(sin(angle), -1, 1, 0, maxRotation);

    float opacity = map(w * h, 20, 300, 255, 50);
    opacity = constrain(opacity, 50, 255);

    if (y < 645) {
      fill(random(100, 255), random(100, 255), random(100, 255), opacity);
      pushMatrix();
      translate(x, y);
      rotate(rotation);
      rect(0, 0, w, h);
      popMatrix();
    }
    if (y < 635) {
      fill(random(150, 255), random(150, 255), random(150, 255), opacity);
      pushMatrix();
      translate(x, 670 + (670 - y));
      rotate(-rotation);
      rect(0, 0, w, h);
      popMatrix();
    }
  }
}
