



class Player1 {

  int w;
  int h;
  int x;
  int y;
  int pSpeed;

  int top;
  int bottom;
  int left;
  int right;

  Player1(int playerX, int playerY, int playerW, int playerH,
    int playerSpeed) {
rectMode(CENTER);
    x = playerX;
    y = playerY;
    w = playerW;
    h = playerH;
    pSpeed = playerSpeed;
  }

  void render() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void pMove() {

    if (isMovingUp == true) {
      y -= pSpeed;
    }
    if (isMovingDown == true) {
      y += pSpeed;
    }
    if (isMovingRight == true) {
      x += pSpeed;
    }
    if (isMovingLeft == true) {
      x -= pSpeed;
    }



    top = y - h/2;
    bottom = y + h/2;
    left = x - w/2;
    right = x + w/2;
  }

  void pBorders() {


    if (y <= 0 + h/2 ) {
      isMovingUp = false;
    }
    if (y >= height - h/2) {
      isMovingDown = false;
    }
    if (x <= 0 + h/2) {
      isMovingLeft = false;
    }
    if (x >= width - h/2) {
      isMovingRight = false;
    }
  }
}
