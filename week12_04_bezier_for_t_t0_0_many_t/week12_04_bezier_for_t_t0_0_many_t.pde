// week12_04_bezier_for_t_t0_0_many_t
// https://processing.org/reference/bezier_.html 下面的範例
void setup() {
  size(400, 400); //改這裡
}
PVector p0 = new PVector(120, 80);
PVector p1 = new PVector(320, 20);
PVector p2 = new PVector(320, 300);
PVector p3 = new PVector(120, 300);
float t0 = 0.0;
void draw() {
  background(255);
  noFill();
  stroke(255, 102, 0);
  line(120, 80, 320, 20);
  line(320, 300, 120, 300);
  stroke(0, 0, 0);
  bezier(120, 80, 320, 20, 320, 300, 120, 300);
  for(float t = t0; t>=0; t-=0.025){
    float x = p0.x*(1-t)*(1-t)*(1-t) + 3*p1.x*t*(1-t)*(1-t) + 3*p2.x*t*t*(1-t) + p3.x*t*t*t;
    float y = p0.y*(1-t)*(1-t)*(1-t) + 3*p1.y*t*(1-t)*(1-t) + 3*p2.y*t*t*(1-t) + p3.y*t*t*t;
    ellipse(x, y, 10, 10);
  }
}
void mouseDragged() {
  t0 += 0.01 * (mouseX-pmouseX);
}
