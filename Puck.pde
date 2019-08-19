class Puck {
  int gameSpeed = 5;
  float x = width/2;
  float y = height/2;
  float xspeed, yspeed;
  float r = 12;
  Puck() {
    reset();
  }

  void checkPaddleLeft(Paddle p) {
    if (y < p.y + p.h/2 && y > p.y - p.h/2 && x - r < p.x + p.w/2) { 
      if(x > p.x){
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = gameSpeed * cos(angle);
        yspeed = gameSpeed * sin(angle);
        x = p.x + p.w/2 + r;
      }
    }
  }
  
  void checkPaddleRight(Paddle p) {
    if (y < p.y + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2) { 
      if(x < p.x){
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        xspeed = gameSpeed * cos(angle);
        yspeed = gameSpeed * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }

  void update() {
    x += xspeed;
    y += yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    gameSpeed = 5;
    xspeed = gameSpeed * cos(angle);
    yspeed = gameSpeed * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void edges() {
    if (y < 0 || y > height) {
      yspeed *= -1;
    }

    if (x - r > width) {
      leftScore++;
      reset();
    }

    if (x + r < left.w) {      
      rightScore++;
      reset();
    }
  }


  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}
