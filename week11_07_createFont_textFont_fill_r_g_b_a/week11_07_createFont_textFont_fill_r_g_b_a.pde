// 半透明的文文字視窗
PImage imgBG;
void setup(){
  size(883,575);
  PFont font = createFont("王漢宗中行書繁", 30);
  textFont(font);
  imgBG = loadImage("background.png");
}
void draw(){
  background(imgBG);
  fill(255, 0, 0, 128); // 半透明的紅色
  rect(50, 50, 300, 200);
  fill(0, 255, 0, 128); // 半透明的綠色
  text("中文", 100, 100);
}
