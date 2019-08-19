class Paddle{
  float x;
  float y = height/2;
  float w = 10;
  float h = 100;
  
  float ychange = 0;
  boolean leftCom;
  
  Paddle(boolean left_){
    if(left_){
      x = w;
    }
    else{
      x = width - w;
    }
    leftCom = left_;
  }
  
  void update(){
    y += ychange;
    y = constrain(y,h/2,height-h/2);
  }
  
  void move(float steps){
    ychange = steps;
  }
  
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h,5);
  }
}
