// week07_03_arras03_atan_angle_rotate_translate_myTank
void setup(){
  size(500,400);
}
float x = 250, y = 200;
void draw(){
  background(215,184,200);
  float dx = mouseX - x, dy = mouseY - y;
  float a = atan2(dy, dx); // atan2() 算出角度
  line(x, y, mouseX, mouseY);
  myTank(x, y, a);
}
void myTank(float x, float y, float a){
  translate(x, y); //大二下圖學課,教的移動
  rotate(a); //大二下圖學課,教的旋轉
  fill(167,167,175);
  stroke(110,110,113);
  strokeWeight(4);
  rect(20,-10, 20,20); //炮管/炮塔

  fill(204,102,156);
  stroke(125,84,105);
  strokeWeight(3);
  ellipse(0, 0, 55, 55); //圓形的身體
}
