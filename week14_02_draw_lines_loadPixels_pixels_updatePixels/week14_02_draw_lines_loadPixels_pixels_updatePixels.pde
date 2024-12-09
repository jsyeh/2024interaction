// week14_02_draw_lines_loadPixels_pixels_updatePixels
void setup(){
  size(500, 500);
  background(255); //背景設成白色
}
void draw(){
  //pixels
}
void mouseDragged(){
  if(mouseButton==LEFT){ // 在左鍵dragged拖曳時
    line(mouseX, mouseY, pmouseX, pmouseY); //本來的線,是灰黑色,不是白色
    loadPixels(); //取出畫面的像素
    //println(pixels[0]); //白色是-1 其實是 color(255,255,255,255)
    for(int i=0; i < width*height; i++){ //全部的點,都去巡一下色彩
      if(pixels[i] != -1) pixels[i] = color(random(255),random(255),random(255)); 
    }//如果「不是白色」就是有畫圖碰到的pixels,都變成亂數的彩色
    updatePixels(); // 若有修改,要再放回去
  } 
}
