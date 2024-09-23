// week03_3_arufa_rect_rect_rect
// 把 File-Preference 字型設大一點
// 把網路下載的 arufa.jpg 拉到程式的框框裡
PImage img;
void setup(){
  size(600, 400);
  img = loadImage("arufa.jpg");
}
void draw(){
  image(img, 0, 0);
  noCursor(); // 不要有cursor游標/鼠標
  noStroke(); // 不要有框線
  fill(200,200,255, 128); // 藍藍的半透明

  rect(mouseX, mouseY-80, 70, 50); 
  
  rect(mouseX-30, mouseY-40, 70, 50);  
  rect(mouseX+30, mouseY-40, 70, 50);  

  rect(mouseX+60, mouseY, 70, 50);
  rect(mouseX, mouseY, 70, 50); 
  rect(mouseX-60, mouseY, 70, 50);
  
  rect(mouseX-90, mouseY+40, 70, 50);  
  rect(mouseX-30, mouseY+40, 70, 50);  
  rect(mouseX+30, mouseY+40, 70, 50);  
  rect(mouseX+90, mouseY+40, 70, 50);  

  rect(mouseX+60, mouseY+80, 70, 50);
  rect(mouseX, mouseY+80, 70, 50); 
  rect(mouseX-60, mouseY+80, 70, 50);

  rect(mouseX-30, mouseY+120, 70, 50);  
  rect(mouseX+30, mouseY+120, 70, 50);  

  rect(mouseX, mouseY+160, 70, 50); 
}
