// week14_05_draw_lines_myFloodFill_x_y_c1_c2_pixels_isOK
void setup(){
  size(500, 500);
  background(#FFFFF2); //先畫淡黃色背景
}
void draw(){
  if(mousePressed && mouseButton==LEFT) line(mouseX, mouseY, pmouseX, pmouseY);
  if(mousePressed && mouseButton==RIGHT){
    loadPixels();
    color c1 = pixels[mouseX+mouseY*500]; // 原本色彩 c1
    color c2 = color(random(255), random(255), random(255)); // 亂數挑色彩c2
    if(c1!=c2) myFloodFill(mouseX, mouseY, c1, c2); // 色彩不同,才做填色功能
    updatePixels();
  }
}
boolean isOK(int x, int y, color c){
  if(x<0 || y<0 || x>=500 || y>=500) return false; //超過邊界
  if(pixels[x+y*500]!=c) return false;
  return true;
}
void myFloodFill(int x, int y, color c1, color c2){
  pixels[x+y*500] = c2;
  if(isOK(x+1,y,c1)) myFloodFill(x+1,y,c1,c2);
  if(isOK(x-1,y,c1)) myFloodFill(x-1,y,c1,c2);
  if(isOK(x,y+1,c1)) myFloodFill(x,y+1,c1,c2);
  if(isOK(x,y-1,c1)) myFloodFill(x,y-1,c1,c2);
}
