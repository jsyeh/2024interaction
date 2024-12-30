// week17_14_stage_class_Circle_insideRectAndKeyPressed_change1
void setup(){
  size(500,500);
  c.y = 250;
  c.dir = UP;
}
Circle c = new Circle();
void draw(){
  background(#FFFFF2);
  fill(255); 
  rect(300, 200, 100, 100);
  c.insideRectAndKeyPressed(c, 300, 200, 100, 100); 
  c.draw();
  c.update();
}
class Circle {
  int state = 0; //0: normal blue, 1: animation white, 2: red
  int animT = 0;
  int dir = 0;
  float x, y;
  void draw(){
    if(state==0) fill(0,0,255);
    if(state==1) fill( 255, lerp(255, 0, 1-animT/60.0), lerp(255, 0, 1-animT/60.0));
    if(state==2) fill(255,0,0);
    ellipse(x, y, 40, 40);
  }
  void insideRectAndKeyPressed(Circle c, int x, int y, int w, int h) {
    if(x<c.x && c.x <x+w && y<c.y && c.y<y+h){
      if(keyPressed && keyCode==c.dir) c.change1();
    }
  }
  void change1(){
    state = 1;
    animT = 60; //要從很白,慢慢變紅, 花1秒    
  }
  void update(){
    x+=2;
    if(state==1){
      animT--;
      if(animT==0) state=2;
    }
    if(x>500){
      state=0;
      x = 0;
    }
  }
}
