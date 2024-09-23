// week03_2_void_setup_void_draw_fill_rect
// 把 File-Preference 字型設大一點
// 把網路下載的 arufa.jpg 拉到程式的框框裡
PImage img;
void setup(){
  size(600, 400);
  img = loadImage("arufa.jpg");
}
void draw(){
  image(img, 0, 0);
  noStroke();
  fill(200,200,255, 128);
  rect(mouseX, mouseY, 70, 50);
}
