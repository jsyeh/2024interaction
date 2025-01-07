// week18_3_zuma_bezier_curve_myNearestBezierT_mouseX_mouseY
void setup(){
  size(500,500);
}
PVector p0 = new PVector(340, 80);
PVector p1 = new PVector(40, 40);
PVector p2 = new PVector(360, 360);
PVector p3 = new PVector(60, 320);
void draw(){
  background(#FFFFF2);
  noFill();
  bezier(340, 80, 40, 40, 360, 360, 60, 320);
  float t = myNearestBezierT(mouseX, mouseY, p0, p1, p2, p3);
  PVector p = myBezier(t, p0, p1, p2, p3);
  ellipse(p.x, p.y, 8,8);
}
float myNearestBezierT(float x0, float y0, PVector p0, PVector p1, PVector p2, PVector p3){
  float ans = 0, minD = Float.MAX_VALUE;
  for(float t=0; t<=1; t+=0.01){
    float t1 = 1 - t;
    float x = t1*t1*t1*p0.x + 3*t1*t1*t*p1.x + 3*t1*t*t*p2.x + t*t*t*p3.x;
    float y = t1*t1*t1*p0.y + 3*t1*t1*t*p1.y + 3*t1*t*t*p2.y + t*t*t*p3.y;
    float d = dist(x, y, x0, y0);
    if(d<minD){
      minD = d;
      ans = t;
    }
  }
  return ans;
}
PVector myBezier(float t, PVector p0, PVector p1, PVector p2, PVector p3){
  float t1 = 1 - t;
  float x = t1*t1*t1*p0.x + 3*t1*t1*t*p1.x + 3*t1*t*t*p2.x + t*t*t*p3.x;
  float y = t1*t1*t1*p0.y + 3*t1*t1*t*p1.y + 3*t1*t*t*p2.y + t*t*t*p3.y;
  return new PVector(x,y);
}
