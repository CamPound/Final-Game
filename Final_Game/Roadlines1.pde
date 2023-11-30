

class Roadlines1{

int ySpeed = 3 + 1/2;

int numRectangles = 20;  // Number of rectangles
int [] rectY = new int[numRectangles];  // Array to store Y positions of rectangles


void lineArray(){
  for (int i = 0; i < numRectangles; i++) {
    rectY[i] = i * 50;  // Initialize Y positions of rectangles
  }
}
void moveLanes(){
    // Draw and move rectangles
  for (int i = 0; i < numRectangles; i++) {
    noStroke();
    fill(255, 255, 200);  
    rect(400, rectY[i], 15, 30);  // Draw rectangle

    // Move rectangles down the screen
    rectY[i] = rectY[i] + ySpeed;
    
    // Reset Y position if the rectangle goes below the canvas
    if (rectY[i] > height) {
      rectY[i] = 0;
    }
  }
  
    for (int i = 0; i < numRectangles; i++) {
    fill(255, 255, 200);  // Set fill color to blue
    rect(200, rectY[i], 15, 30);  // Draw rectangle

    // Move rectangles down the screen
    rectY[i] = rectY[i] + ySpeed;
    
    // Reset Y position if the rectangle goes below the canvas
    if (rectY[i] > height) {
      rectY[i] = 0;
    }
  }
  
    for (int i = 0; i < numRectangles; i++) {
    fill(255, 255, 200);  // Set fill color to blue
    rect(600, rectY[i], 15, 30);  // Draw rectangle

    // Move rectangles down the screen
    rectY[i] = rectY[i] + ySpeed;
    
    // Reset Y position if the rectangle goes below the canvas
    if (rectY[i] > height) {
      rectY[i] = 0;
    }
  }

  for (int i = 0; i < numRectangles; i++) {
    noStroke();
    fill(255, 255, 200);  // Set fill color to blue
    rect(800, rectY[i], 15, 30);  // Draw rectangle

    // Move rectangles down the screen
    rectY[i] = rectY[i] + ySpeed;
    
    // Reset Y position if the rectangle goes below the canvas
    if (rectY[i] > height) {
      rectY[i] = 0;
    }
  }

}
}
