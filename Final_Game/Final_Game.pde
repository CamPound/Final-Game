


ArrayList<Car1> rectangles;
float rectWidth, rectHeight;
float[] laneX;
float speed;
float interval;
float lastSpawnTime;
float speedIncrease = 0.009; // Speed increase per frame

boolean isMovingUp = false;
boolean isMovingDown = false;
boolean isMovingLeft = false;
boolean isMovingRight = false;

int state = 0;

int ySpeed = 2;

int numRectangles = 20;  // Number of rectangles
int[] rectY = new int[numRectangles];  // Array to store Y positions of rectangles

Animation a1;
Animation a2;
Animation a3;


Player1 p1;

Roadlines1 r1;

Car1 c1;

PImage endScreen;
//PImage introScreen;
PImage[] images = new PImage[5];
PImage[] images1 = new PImage[4];
PImage[] images2 = new PImage[12];

import processing.sound.*;
SoundFile gameSong;
SoundFile crashSound;
SoundFile engineRev;

long startTime;

void setup() {
  size(1000, 900);
  
    startTime = millis();

gameSong = new SoundFile(this,"Game Song.wav");
gameSong. play();

crashSound = new SoundFile(this, "CrashSound.wav");

engineRev = new SoundFile(this, "Engine Rev.wav");

  // initialize vars
  boolean isMovingUp = false;
  boolean isMovingDown = false;
  boolean isMovingLeft = false;
  boolean isMovingRight = false;
  
rectMode(CENTER);
  p1 = new Player1(500, 450, 110, 170, 10);

  r1 = new Roadlines1();
  
 endScreen = loadImage("Crashed car.jpeg");
 endScreen.resize(endScreen. width *4, endScreen. height*5);
 
 //introScreen = loadImage("Start Screen. jpeg");
 //introScreen. resize(introScreen. width/2, introScreen. height/2);
  
  for (int i = 0; i <images. length; i ++) {
    images[i] = loadImage ("sprite_" +i+ ".png");
  }
  
    for (int i = 0; i <images1. length; i ++) {
    images1[i] = loadImage ("sprite2_" +i+ ".png");
  }
  
      for (int i = 0; i <images2. length; i ++) {
    images2[i] = loadImage ("background1_" +nf(i,2)+ ".png");
  }
  
  a1 = new Animation(images, 0.2, 4);
  a2 = new Animation(images1, 0.2, 4);
  a3 = new Animation(images2, 0.2, 5);

  rectWidth = 110;
  rectHeight = 175;
  laneX = new float[5];
  speed = 2;
  interval = random(100, 500); // Initial random interval

  for (int i = 0; i < 5; i++) {
    laneX[i] = i * width/5 + rectWidth;
  }

  rectangles = new ArrayList<Car1>();
  lastSpawnTime = millis();

  r1. lineArray();
}


void draw() {
  
  switch(state){

  case 0:
  startScreen();
  break;

  case 1:
  playScreen();
  break;
  
  case 2: 
  crashScreen();
  reset();
  break;
}

   
}

void spawnRectangle() {
  int lane = int(random(5));
  float rectX = laneX[lane];
  float rectY = -rectHeight; // Start above the canvas

  // Add a new rectangle to the ArrayList
  rectangles.add(new Car1(rectX, rectY));
}

void startScreen(){
  background(100);
  a3. display(width/2, height/2);
  a3.isAnimating = true;
  
  textAlign(CENTER);
  text("Controls: WASD keys", width/2 + width/4, height - height/8);
  textSize(40);
}

void playScreen(){
    background(140);
    
      float elapsedTime = (millis() - startTime) / 1000.0;

  // Display the elapsed time
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
  text("Time: " + nf(elapsedTime, 0, 2) + " ", width/8, height - height/2 - height/3 - height/8);
  
  r1. moveLanes();

  //PLAYER////////////////////
  a1. display(p1.x, p1. y);
  p1. pMove();
  p1. pBorders();

  // Move and draw existing rectangles
  for (int i = rectangles.size() - 1; i >= 0; i--) {
    Car1 r = rectangles.get(i);
    r.move();

    // Remove rectangles that are below the canvas
    if (r.y > height) {
      rectangles.remove(i);
    }
  }

  // Check if it's time to spawn a new rectangle
  if (millis() - lastSpawnTime > interval) {
    spawnRectangle();
    lastSpawnTime = millis();
    interval = random(700, 1500); // Set a new random interval
  }

  // Increase speed over time
  speed += speedIncrease;
  
   for (Car1 aCar: rectangles){
    a2. display(aCar. x, aCar.y);
    aCar.collide(p1);
    if (aCar.isHit == true){
      state = 2;
    }
  }
}

void crashScreen(){
    background(255);
    textAlign(CENTER);
    textSize(100);
    fill(255);
    image(endScreen, width/2, height/2);
    text("WHOOPS!", width/2, height/2);
    text("JUST A SCRATCH", width/2, height - height/3);
    textSize(60);
    text("Press Space to Restart", width/2, height - height/4); 
}

void reset(){ 
  // initialize vars
  boolean isMovingUp = false;
  boolean isMovingDown = false;
  boolean isMovingLeft = false;
  boolean isMovingRight = false;
  
rectMode(CENTER);
  p1 = new Player1(500, 450, 110, 150, 10);
  r1 = new Roadlines1();

  rectWidth = 110;
  rectHeight = 150;
  laneX = new float[5];
  speed = 2;
  interval = random(100, 500); // Initial random interval

  for (int i = 0; i < 5; i++) {
    laneX[i] = i * width/5 + rectWidth;
  }

  rectangles = new ArrayList<Car1>();
  lastSpawnTime = millis();

  r1. lineArray();
}


void keyPressed() {
  if (key == 'd') {
    isMovingRight = true;
  }
  if (key == 'a') {
    isMovingLeft = true;
  }
  if (key == 'w') {
    isMovingUp = true;
    a1. isAnimating = true;
    engineRev. play();
    
  }
  if (key == 's') {
    isMovingDown = true;
  }
  
  if (key == ' ' && state == 0) {
    state = 1;
  }
  
  if (key == ' ' && state == 2) {
    state = 0;
  }
}


void keyReleased() {
  if (key == 'w') {
    isMovingUp = false;
    a1. isAnimating = false;
  }
  if (key == 'd') {
    isMovingRight = false;
  }
  if (key == 's') {
    isMovingDown = false;
  }
  if (key == 'a') {
    isMovingLeft = false;
  }
}
