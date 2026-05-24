class Rocket {
  PImage rocketImage;
  int x, y;  
  int speedX, speedY;  //Speed (X and Y direction)

boolean touches(Astronaut astronaut) {
  float d=dist(x, y, astronaut.x, astronaut.y);  
  return d<20;  //rockets and astronaut will collide if distance(d) is less than 20
}

  Rocket(int startX, int startY) {
    x=startX; 
    y=startY;
    rocketImage=loadImage("rocketimage.png");  //Load rocket image
   
    
    //when speed is zero this sets to one so rockets keep moving
speedX = (int) random(3, 8) * (random(1) > 0.5 ? 1 : -1);
speedY = (int) random(3, 8) * (random(1) > 0.5 ? 1 : -1);
  }

  //Display the rocket on the screen
  void display() {
    imageMode(CENTER);
    image(rocketImage, x, y, 20, 20);  //rocket displayed at x,y 
  }

  //move rockets
void move() {
  // Move the rocket by its speed each frame
  x += speedX;
  y += speedY;

  // Bounce off left/right edges
  if (x <= 0 || x >= width) {
    speedX *= -1;   // reverse direction
    speedX *= 1.1;  // speed up a little
    speedY *= 1.05;
    x = constrain(x, 0, width);
  }

  // Bounce off top/bottom edges
  if (y <= 0 || y >= height) {
    speedY *= -1;
    speedX *= 1.05;
    speedY *= 1.1;
    y = constrain(y, 0, height);
  }

  speedX = constrain(speedX, -15, 15);
  speedY = constrain(speedY, -15, 15);
  }
}
