// week13_07_tetris_falling
void setup(){
  size(300,600);
}
float x = 50, y = 50;
void draw(){
  background(0);
  fill(153, 0, 204);
  rect(x, y-25, 25, 25);
  rect(x+25, y, 25, 25);
  rect(x, y, 25, 25);
  rect(x, y+25, 25, 25);
  if(frameCount%50==0) y += 25;
}
void keyPressed(){
  if(keyCode==RIGHT) x += 25;
  if(keyCode==LEFT) x -= 25;
}
