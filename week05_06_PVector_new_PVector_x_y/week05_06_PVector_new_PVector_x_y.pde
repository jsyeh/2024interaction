// week05_06_PVector_new_PVector_x_y
void setup(){
  size(400,600);
  c = new PVector(200, 100); // new 出新物件
  p = new PVector(200, 130); // new 出新物件
}
PVector c, p;
void draw(){
  background(255);
  ellipse(c.x, c.y, 10, 10); // 使用物件的 c.x
  ellipse(p.x, p.y, 10, 10);
}
