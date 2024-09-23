// week03_6_go_void_setup_void_draw_ellipse_mouseX_mouseY
void setup(){
  size(450, 450);
}
void draw(){
  background(220,179,92);
  strokeWeight(2);
  for(int i=0; i<9; i++){
    line(25, 25 + i*50, 425, 25 + i*50);
    line(25 + i*50, 25, 25 + i*50, 425);
  }
  ellipse(mouseX, mouseY, 45, 45);
}
