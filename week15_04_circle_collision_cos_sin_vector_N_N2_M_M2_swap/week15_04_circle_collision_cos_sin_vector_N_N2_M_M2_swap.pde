// week15_04_circle_collision_cos_sin_vector_N_N2_M_M2_swap
void setup(){
  size(640, 360);

}
Ball ball = new Ball(100, 100, 60);
Ball ball2 = new Ball(100, 300, 60);
void draw(){
  background(51);
  ball.checkCollision(ball2);

  fill(255,255,0);
  ball.update(); //加這行
  ball.display();
  fill(255);
  ball2.update();
  ball2.display();
}
//把 class Ball 移到右邊的新的分頁(名字也叫 Ball)
