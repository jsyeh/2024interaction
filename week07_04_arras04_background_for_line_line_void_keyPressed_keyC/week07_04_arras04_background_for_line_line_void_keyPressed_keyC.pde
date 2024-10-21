// week07_04_arras04_background_for_line_line_void_keyPressed_keyCode
void setup(){
  size(500,400);
}
void keyPressed(){
  if(keyCode==RIGHT) x += 1;
  if(keyCode==LEFT) x -= 1;
  if(keyCode==UP) y -= 1;
  if(keyCode==DOWN) y += 1;
}
float x = 250, y = 200;
void draw(){
  background(219); //灰底
  stroke(210); //灰底的線
  strokeWeight(1);
  for(int i=0; i<30; i++){
    line(0, i*30, 500, i*30);
    line(i*30, 0, i*30, 500);
  }
  //background(215,184,200); //紅底
  //stroke(211,180,196); //紅底的線
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
