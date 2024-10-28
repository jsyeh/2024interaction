// week08_03_RPG_PImage_createImage_copy_save 用複制過來的, 因為要剛剛的圖 640x480.png
PImage img;
void setup(){
  size(640,480); //15格=480, 480/15=32 小圖
  img = loadImage("640x480.png");
}
void draw(){
  background(img);
  for(int i=0; i<15; i++){ //高度 480 對應 y 座標 左手i
    for(int j=0; j<20; j++){ //寬度 640 對應 x 座標 右手j
      noFill();
      stroke(0);
      rect(j*32, i*32, 32, 32); //小格子的大小是 32x32
    }
  }
  stroke(255, 0, 0);
  rect(J*32, I*32, 32, 32);
}
int I = -1, J = -1;
void mouseMoved(){ // void Moved() 移動時,要修改 I, J
  I = mouseY/32; //小心 Y
  J = mouseX/32; //小心 X
}
void mousePressed(){
  //PImage now = createImage(640, 480, RGB);
  //now.copy(img, 0, 0, 640,480, 0, 0, 640, 480);
  PImage now = createImage(32, 32, RGB);
  now.copy(img, J*32, I*32, 32, 32, 0, 0, 32, 32);
  now.save("1.png");
}
