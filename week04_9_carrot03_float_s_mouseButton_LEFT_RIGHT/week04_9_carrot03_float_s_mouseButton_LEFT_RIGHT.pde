// week04_9_carrot03_float_s_mouseButton_LEFT_RIGHT
void setup(){
  size(600,500);
  background(0); //黑畫1次
  stroke(255);
  fill(0);
}
void draw(){
  //ellipse(mouseX, mouseY, 100, 100);
}
float s = 25;
void mousePressed(){ //mousePressed()
  ellipse(mouseX, mouseY, s, s);
  if(mouseButton==LEFT) s *= 1.1;
  if(mouseButton==RIGHT) s *= 0.9;
}
