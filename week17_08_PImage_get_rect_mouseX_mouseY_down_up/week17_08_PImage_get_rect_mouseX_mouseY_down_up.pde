// week17_08_PImage_get_rect_mouseX_mouseY_down_up
PImage img, img2 = null;
void setup(){
  size(400, 230);
  img = loadImage("bg.png");
}
void draw(){
  background(img);
  if(downX != -1){
    rect(downX, downY, mouseX-downX, mouseY-downY);
  }
  if(img2 != null){
    image(img2, 0, 0);
  }
}
int downX = -1, downY = -1, upX = -1, upY = -1;
void mousePressed(){
  downX = mouseX;
  downY = mouseY;
}
void mouseReleased(){
  upX = mouseX;
  upY = mouseY; 
  img2 = img.get(downX, downY, mouseX-downX, mouseY-downY);
}
