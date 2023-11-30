


class Car1 {
  float x;
  float y;
  
  float top;
  float bottom;
  float left;
  float right;
  
  boolean isHit = false;
  
  //Contrsuctor
  Car1(float x, float y) {
    this.x = x;
    this.y = y;
    rectMode(CENTER);
    top = y - rectHeight/2;
    bottom = y + rectHeight/2;
    left = x - rectWidth/2;
    right = x + rectWidth/2;
  }
  
  void move() {
    y += speed;
    rectMode(CENTER);
    top = y - rectHeight/2;
    bottom = y + rectHeight/2;
    left = x - rectWidth/2;
    right = x + rectWidth/2;
  }
  
  void display() {
    rectMode(CENTER);
    fill(0, 150, 255);
    rect(x, y, rectWidth, rectHeight);
  }



void collide(Player1 player){
 if (bottom > player.top &&
  top < player.bottom &&
  left < player.right &&
  right > player.left){
    crashSound. play();
isHit = true;
    
}
}
}
