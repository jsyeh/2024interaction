// week02_9_pacman_radians_abs_frameCount_if_keyPressed
void setup(){
  size(400, 400);
}
int x = 200, y = 200, d = 0;
void draw(){
  background(255);
  fill(#FFDC0F);
  float a = radians(abs(frameCount%90-45));
  int [] dx = {1, 0, -1, 0};
  int [] dy = {0, 1, 0, -1};
  if(keyPressed) x += dx[d];
  if(keyPressed) y += dy[d];
  arc(x, y, 100, 100, PI/2*d+a, PI/2*d + PI*2 - a, PIE);
}
void keyPressed(){
  if(keyCode==RIGHT) d = 0;
  if(keyCode==DOWN) d = 1;
  if(keyCode==LEFT) d = 2;
  if(keyCode==UP) d = 3;
}
