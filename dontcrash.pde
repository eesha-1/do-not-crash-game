// Don't Crash Game.
// Author: Eesha Mohammed.
// A simple reflex game, move the astronaut to avoid collision with the rockets.
// Technology used: Java (Processing).
// January 2025.

PImage bgImage; //PImage for star background image
Astronaut astronaut; //Declaring the player which I called astronaut/ is an astronaut
ArrayList<Rocket> rockets; //Declaring ArrayList classRocket
boolean gameOver = false; //initialising gameOver to false 

int score = 0;
int startTime = 0;
boolean gameStarted = false;

void setup() {
  size(500, 500); //Setting the size of screen 
  bgImage = loadImage("starbackground.png"); //Loading the star background image
  astronaut = new Astronaut(width / 2, height / 2); //Setting the astronaut's position (Central)
  rockets = new ArrayList<Rocket>();
 for (int i = 0; i < 7; i++) {
    int startX = (int)random(width);  
    int startY = (int)random(height);  
    rockets.add(new Rocket(startX, startY));
  } //for loop for placing the 7 rockets in random locations on the screen
  frameRate(75); 
}


void draw() {
  if (gameStarted && !gameOver) {
    score = (millis() - startTime) / 1000;
  }
  background(0); //background colour to black
  imageMode(CORNER); //draw background image from corner of screen 
  image(bgImage, 0, 0, width, height); //draw background image from corner (0,0) to (width,height) 
    if (gameOver) {
    textAlign(CENTER, CENTER); //text in middle of screen
    textSize(20); 
 
    fill(255, 255, 255); //white text colour 
    text("GAME OVER, click space bar to play again :)", width / 2, height / 2);  //display text to middle of the screen
    noLoop();  //stopping the loop
    return;  
  } 
    
   astronaut.display(); //display astronaut

   for (Rocket r: rockets) {  
   //move and display rockets
   r.move();
   r.display();   
    
   if (r.touches(astronaut)) {
   gameOver = true;  //game finishes when a rocket touches the astronaut  
  }
 }
 textAlign(LEFT, TOP);
 textSize(18);
 fill(255);
 text("Score: " + score, 10, 10);
}
 
void resetGame() {
  astronaut= new Astronaut(width/2, height/2); //reset astronaut to center of screen again

  rockets.clear();  //clear all of the rockets
  for (int i = 0; i < 7; i++) {
    int startX = (int)random(width); 
    int startY = (int)random(height);
    rockets.add(new Rocket(startX, startY)); //add rocket at random location on screen
  }

  gameOver = false; //reset game over to false 
  startTime = millis();
  score = 0;
  gameStarted = true;
  loop(); //reset loop
}

void keyPressed() {
  int dx = 0;  // movement in x
  int dy = 0;  // movement in y
  
  // Determine direction
  if (keyCode == LEFT) dx = -5;   // move left
  else if (keyCode == RIGHT) dx = 5; // move right
  else if (keyCode == UP) dy = -5;   // move up
  else if (keyCode == DOWN) dy = 5;  // move down

  // Move the astronaut
  astronaut.move(dx, dy);

  // Restart game if SPACE is pressed
  if (key == ' ') {
    resetGame();
  }
}
