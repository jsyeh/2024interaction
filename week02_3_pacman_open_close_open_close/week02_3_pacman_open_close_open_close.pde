// week02_3_pacman_open_close_open_close
void setup(){
  size(400, 400);
}
void draw(){
  background(255);
  fill(#FFDC0F);
  float a = frameCount % 180; //0..45..90..180
  if(a<45) a = radians(a);
  else if(a<90) a = radians(90-a);
  else if(a<135) a = radians(a-90);
  else if(a<180) a = radians(180-a);
  arc(200, 200, 300, 300, 0+a, PI*2-a, PIE);
}
