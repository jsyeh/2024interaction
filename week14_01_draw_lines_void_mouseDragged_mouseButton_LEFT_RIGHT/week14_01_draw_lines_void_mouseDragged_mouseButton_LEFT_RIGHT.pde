// week14_01_draw_lines_void_mouseDragged_mouseButton_LEFT_RIGHT
void setup(){
  size(500, 500);
}
int x = -1, y = -1;
void draw(){
  if(x != -1){
    ellipse(x, y, 1, 1);
    y++; //往下滴 (x,y)座標中, y慢慢變大,就是往下滴的感覺
  }
}
void mouseDragged(){ // 要用右鍵拖曳,才會滴下噁心的水滴
  if(mouseButton==LEFT) line(mouseX, mouseY, pmouseX, pmouseY);
  if(mouseButton==RIGHT){ //右鍵,才會滴下去
    x = mouseX;
    y = mouseY;
  }
}
