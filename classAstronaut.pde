class Astronaut 
{
  PImage astronautImage; //pimage for astronaut image 
  int x, y; 
  
  Astronaut(int x, int y) 
  {
    this.x = x; 
    this.y = y;
    astronautImage = loadImage("astronautimage.png"); //load astronaut image
  }
  
  void display() 
  {
    imageMode(CENTER); //image drawn from center
    image(astronautImage, x, y, 55,55);//astronaut position and size 
  }
  
  void move(int dx, int dy) {
  x = constrain(x + dx, 0, width);
  y = constrain(y + dy, 0, height);
}
}
