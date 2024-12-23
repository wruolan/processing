int maxImages = 50; // number of images
int imageIndex = 0;

// declare array
PImage[] images = new PImage[maxImages];

void setup() {
  size(600, 800);

  // load image to array
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "test" + i + ".JPEG" );
  }
  frameRate(6);
}

void draw() {
  // scale to fill
  image(images[imageIndex], 0, 0, width, height);
  // increment index
  // use % to loop
  imageIndex = (imageIndex + 1) % images.length;
}
