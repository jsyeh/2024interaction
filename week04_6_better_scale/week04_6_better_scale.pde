// week04_6_better_scale
PShape world;
void setup(){
  size(800,400);
  world = loadShape("world.svg");
}
float s = 0.4, x = 0, y = 0;
float realX = 0, realY = 0; //地圖上, 真的座標
void draw(){
  background(#92C2F5);
  translate(x, y); //要再加上一個移動量 x, y
  scale(s); //改用變數 s 初始值是 0.4
  shape(world);
  ellipse(realX, realY, 10/s,10/s); //地圖上, 真的座標
}
void mouseDragged(){ // void mouseDragged()
  x += mouseX - pmouseX;
  y += mouseY - pmouseY;
}
void mouseWheel(MouseEvent e){ // void mouseWheel(MouseEvent e)
  realX = (mouseX - x) / s; //地圖上, 真的座標
  realY = (mouseY - y) / s; //地圖上, 真的座標
  float oldS = s;
  if(e.getCount()>0) s *= 1.1;
  else s *= 0.9;
  x = x + realX*oldS - realX*s;
  y = y + realY*oldS - realY*s;
}
