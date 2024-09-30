// week04_a_carrot04_float_t_cos_t_sin_t
void setup(){
  size(600,500);
  background(0); //黑畫1次
  stroke(255);
  fill(0);
}
void draw(){
  //ellipse(mouseX, mouseY, 100, 100);
}
float s = 25, t = 0;
void mousePressed(){ //mousePressed()
  ellipse(300+200*cos(t), 250+200*sin(t), s, s);
  t += 0.06;
  if(mouseButton==LEFT) s *= 1.1;
  if(mouseButton==RIGHT) s *= 0.9;
}
