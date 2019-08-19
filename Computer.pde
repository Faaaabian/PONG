class Computer {
  Paddle racket;
  int lvl;
  float offset;
  float os;

  Computer(Paddle pad, int _lvl) {
    racket = pad;
    lvl = _lvl ;
    offset = racket.h/2;
    displayLvl(_lvl);
  }
  
  void displayLvl(int level){
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text(level, width - 25, 25);
  }
  
  void playNormal(){
    displayLvl(lvl);
    if(puck.x > width/2 && !racket.leftCom){
      if(puck.y <= racket.y && puck.y - racket.y <= -5){
        racket.y -= lvl*0.75;
      }
      else if(puck.y - racket.y >= 5){
        racket.y += lvl*0.75;
      }
    }
    else if(puck.x < width/2 && racket.leftCom){
      
    }
  }

  void playNormal1() {    
    if (puck.x > width/2 && !racket.leftCom) {
      racket.y = puck.y + offset;
    } else if (puck.x < width/2 && racket.leftCom) {
      racket.y = puck.y + offset;
    }
  }

  void overkill() {
    if (puck.x > width/2 && !racket.leftCom) {
      racket.y = puck.y;
    } else if (puck.x < width/2 && racket.leftCom) {
      racket.y = puck.y;
    }
  }
}
