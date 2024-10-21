// week07_07_arras07_angle_bulletX_bulletY_bulletVX_bulletVY 
// 要有武器射出來
void setup(){
  size(500,400);
}
void keyPressed(){ //按下去時,會有速度, 放開後,速度要變成0
  if(keyCode==RIGHT) vx = 1; //x += 1;
  if(keyCode==LEFT) vx = -1; //x -= 1;
  if(keyCode==UP) vy = -1; //y -= 1;
  if(keyCode==DOWN) vy = 1;//y += 1;
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx = 0;
  if(keyCode==UP || keyCode==DOWN) vy = 0;
}
float x = 250, y = 200, vx = 0, vy = 0; //代表移動的速度
void draw(){
  x += vx;
  y += vy;
  background(219); //灰底
  translate(-x, -y); //讓全世界,都向反方向移動
  translate(width/2, height/2); //把 0,0 移畫面正中心
  float mx = mouseX+x-width/2, my = mouseY+y-height/2; //換算 mx, my 的坐標
  ellipse(mx, my, 8, 8);
  stroke(210); //灰底的線
  strokeWeight(1);
  for(int i=0; i<30; i++){
    line(0, i*30, 500, i*30);
    line(i*30, 0, i*30, 500);
  }
  //background(215,184,200); //紅底
  //stroke(211,180,196); //紅底的線
  float dx = mx - x, dy = my - y; //改用 mx, my
  float a = atan2(dy, dx); // atan2() 算出角度
  angle = a;
  line(x, y, mx, my); //改用 mx, my
  pushMatrix();
  myTank(x, y, a);
  popMatrix();
  if(bulletVX!=0 && bulletVY!=0){
    bulletX += bulletVX;
    bulletY += bulletVY;
    ellipse(bulletX, bulletY, 20, 20);
  }
}
float angle, bulletX = 0, bulletY = 0, bulletVX = 0, bulletVY = 0; //子彈的x,y位置和速度
void mousePressed(){
  bulletX = x;
  bulletY = y;
  bulletVX = cos(angle);
  bulletVY = sin(angle);
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
