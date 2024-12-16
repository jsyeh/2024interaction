// week15_03_circle_collision_detection_two_ball
void setup(){
  size(640, 360);
}
Ball ball = new Ball(100, 200, 60);
Ball ball2 = new Ball(300, 200, 60);
void draw(){
  background(51);
  if( ball.checkCollision(ball2) ) fill(#FFAAAA);
  else fill(255);
  ball.update(); //加這行
  ball.display();
  ball2.update();
  ball2.display();
}
//把 class Ball 移到右邊的新的分頁(名字也叫 Ball)
