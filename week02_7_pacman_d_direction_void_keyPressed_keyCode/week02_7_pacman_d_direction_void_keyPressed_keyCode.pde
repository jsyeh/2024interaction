// week02_7_pacman_d_direction_void_keyPressed_keyCode
void setup() {
  size(400, 400);
}
float x = 200, y = 200, d=PI/2*0;
void draw() {
  background(255);
  fill(#FFDC0F);
  float a = frameCount % 180;
  if (a<45) a = radians(a);
  else if (a<90) a = radians(90-a);
  else if (a<135) a = radians(a-90);
  else if (a<180) a = radians(180-a);
  arc(x, y, 100, 100, d+0+a, d+PI*2-a, PIE);
}
void keyPressed(){
  if(keyCode==RIGHT){
    x++;
    d = PI/2*0;
  }else if(keyCode==DOWN){
    y++;
    d = PI/2*1;
  }else if(keyCode==LEFT){
    x--;
    d = PI/2*2;
  }else if(keyCode==UP){
    y--;
    d = PI/2*3;
  }
}
