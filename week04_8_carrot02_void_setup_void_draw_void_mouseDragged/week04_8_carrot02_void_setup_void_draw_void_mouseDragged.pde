// week04_8_carrot02_void_setup_void_draw_void_mouseDragged
void setup(){
  size(600,500);
  background(0); //黑畫1次
  stroke(255);
  fill(0);
}
void draw(){
  //ellipse(mouseX, mouseY, 100, 100);
}
void mousePressed(){ //mousePressed()
  ellipse(mouseX, mouseY, 100, 100);
}
