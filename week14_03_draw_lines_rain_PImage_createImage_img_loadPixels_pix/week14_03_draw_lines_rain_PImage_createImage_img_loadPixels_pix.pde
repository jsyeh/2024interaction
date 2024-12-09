// week14_03_draw_lines_rain_PImage_createImage_img_loadPixels_pixels_updatePixels
PImage img;
void setup(){
  size(500,500);
  img = createImage(500, 500, RGB); //用來畫圖的畫布
  img.loadPixels();
  for(int i=0; i<500*500; i++) img.pixels[i] = color(#FFFFF2); // -14
  img.updatePixels();
}
int x = 250, y = 0;
void draw(){
  background(img);
  ellipse(x, y, 20, 20);
  if(y<498 && img.pixels[x+y*500]==-14) y++;
}
void mouseDragged(){
  background(img);
  line(mouseX, mouseY, pmouseX, pmouseY);
  loadPixels();
  img.loadPixels();
  for(int i=0; i<500*500; i++) img.pixels[i] = pixels[i]; //把畫面的色彩,搬到img裡
  img.updatePixels();
  updatePixels();
  ellipse(x, y, 20, 20);
}
