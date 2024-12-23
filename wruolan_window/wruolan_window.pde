float angle = 0;
int animationStartTime;
boolean isRain = true;

void setup() {
  size(1000, 1000);
  animationStartTime = millis();
}

void draw() {
  background(255);

  // switch animation
  if ((millis() - animationStartTime) >= 5000) {
    animationStartTime = millis();
    isRain = !isRain;
  }

  // play animation
  if (isRain) {
    rain();
  } else {
    petals();
  }

  drawWindow();
}

// window
void drawWindow() {
  rectMode(CENTER);

  // highlight
  strokeWeight(12);
  stroke(100);
  noFill();
  rect(width / 2, height / 2, 600, 800);

  // muntins
  strokeWeight(30);
  stroke(0);
  line(width / 2, 100, width / 2, 900);
  line(200, (100 + (800 / 3)), 800, (100 + (800 / 3)));
  line(200, (900 - (800 / 3)), 800, (900 - (800 / 3)));

  // walls
  strokeWeight(1);
  fill(0);
  rect(width / 2, 50, 1000, 100);
  rect(width / 2, 950, 1000, 100);
  rect(100, height / 2, 200, 800);
  rect(900, height / 2, 200, 800);

  // frame
  strokeWeight(6);
  stroke(20);
  noFill();
  rect(width / 2, height / 2, 700, 900);
}
