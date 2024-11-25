// week12-03_bezier_1_3_3_1_equation_mouseDragged_change_t
void setup() {
  size(500, 500);
}
PVector p0 = new PVector(340, 80);
PVector p1 = new PVector(40, 40);
PVector p2 = new PVector(360, 360);
PVector p3 = new PVector(60, 320);
float t = 0.0; 
void draw() {
  background(255);
  noFill(); // 以下,是從文件裡copy來的
  stroke(255, 102, 0);
  line(340, 80, 40, 40);
  line(360, 360, 60, 320);
  stroke(0, 0, 0);
  bezier(340, 80, 40, 40, 360, 360, 60, 320);
  float x = p0.x*(1-t)*(1-t)*(1-t) + 3*p1.x*t*(1-t)*(1-t) + 3*p2.x*t*t*(1-t) + p3.x*t*t*t;
  float y = p0.y*(1-t)*(1-t)*(1-t) + 3*p1.y*t*(1-t)*(1-t) + 3*p2.y*t*t*(1-t) + p3.y*t*t*t;
  ellipse(x, y, 10, 10);
}
void mouseDragged(){
  t += 0.01 * (mouseX-pmouseX);
}
