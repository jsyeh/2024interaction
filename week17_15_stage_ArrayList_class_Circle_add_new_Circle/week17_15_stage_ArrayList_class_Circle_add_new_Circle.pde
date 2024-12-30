// week17_15_stage_ArrayList_class_Circle_add_new_Circle
ArrayList<Circle> cc = new ArrayList<Circle>();
void setup(){
  size(500,500);
}
Circle c = new Circle();
void draw(){
  background(#FFFFF2);
  fill(255); 
  rect(300, 200, 100, 100);
  for(Circle c : cc){
    c.insideRectAndKeyPressed(c, 300, 200, 100, 100); 
    c.draw();
    c.update();
  }
}
void mousePressed(){
  cc.add(new Circle());
}
class Circle {
  int state = 0; //0: normal blue, 1: animation white, 2: red
  int animT = 0;
  int dir = UP;
  float x = 0, y = 250;
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
