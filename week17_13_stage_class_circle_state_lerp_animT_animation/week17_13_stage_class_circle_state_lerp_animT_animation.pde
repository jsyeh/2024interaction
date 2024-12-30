// week17_13_stage_class_circle_state_lerp_animT_animation
void setup(){
  size(500,500);
  c.y = 250;
}
Circle c = new Circle();
void draw(){
  background(#FFFFF2);
  c.draw();
  c.update();
}

class Circle {
  int state = 0; //0: normal blue, 1: animation white, 2: red
  int animT = 0;
  float x, y;
  void draw(){
    if(state==0) fill(0,0,255);
    if(state==1) fill( 255, lerp(255, 0, 1-animT/60.0), lerp(255, 0, 1-animT/60.0));
    if(state==2) fill(255,0,0);
    ellipse(x, y, 40, 40);
  }
  void update(){
    if( dist(mouseX, mouseY, x, y) < 20 ){
      if(mousePressed && state==0){
        state = 1;
        animT = 60; //要從很白,慢慢變紅, 花1秒
      }
    }
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
