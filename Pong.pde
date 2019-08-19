Computer  comp;
int comLvl;

Puck puck;

Paddle left;
Paddle right;

int gameState = 0;
int leftScore = 0;
int rightScore = 0;

void setup() {
  size(600, 400);
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  if (gameState == 0) initScreen();
  if (gameState == 1) actualGame();
  if (gameState == 2) endScreen();
}

void initScreen() {
  background(0);
  textAlign(CENTER);
  textSize(30);
  text("PONG - PRESS SPACE TO PLAY", width/2, height/2);
  textSize(20);
  text("Player 1: a for up, y for down \n Player 2: j for up, m for down", width/2, 2*height/3);
}

void endScreen() {
}


void actualGame() {
  background(0);
  fastenGame();

  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);

  left.show();
  right.show();
  left.update();
  right.update();
  if(comp != null){comp.playNormal();}
  puck.update();
  puck.edges();
  puck.show();

  fill(255);
  textSize(32);
  String score = leftScore + ":" + rightScore;
  if (leftScore < 10 && rightScore < 10) {
    score = "0" + leftScore + ":0" + rightScore;
  } else if (leftScore < 10) {
    score = "0" + leftScore + ":" + rightScore;
  } else if (rightScore < 10) {
    score = leftScore + ":0"  + rightScore;
  }
  textAlign(CENTER);
  text(score, width/2, 40);
}

void fastenGame(){
  if((leftScore + rightScore)%5 == 0){
    puck.gameSpeed++;
  }
  if(puck.gameSpeed == 7 && comp != null){
    comLvl++;
    comp = null;
    comp = new Computer(right, comLvl);
  }
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'a') {
    left.move(-10);
  } else if (key == 'y') {
    left.move(10);
  }
  if (comp == null) {
    if (key == 'j') {
      right.move(-10);
    } else if (key == 'm') {
      right.move(10);
    }
  }

  if (key == ' ' && gameState == 0) {
    gameState = 1;
  }

  if (key == '1' && gameState == 0) {
    comp = new Computer(right, 1);
    comLvl = 1;
    gameState = 1;
  }
  if (key == '2' && gameState == 0) {
    comp = new Computer(right, 2);
    comLvl = 2;
    gameState = 1;
  }
  if (key == '3' && gameState == 0) {
    comp = new Computer(right, 3);
    comLvl = 3;
    gameState = 1;
  }
  if (key == '4' && gameState == 0) {
    comp = new Computer(right, 4);
    comLvl = 4;
    gameState = 1;
  }
  if (key == '5' && gameState == 0) {
    comp = new Computer(right, 5);
    comLvl = 5;
    gameState = 1;
  }
}
