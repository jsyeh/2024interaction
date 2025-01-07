// week18_5_zuma_bezier_curve_many_T_myNextT
//ArrayList<Float> T = new ArrayList<Float>();
FloatList T = new FloatList();
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
  for(int i=0; i<T.size(); i++){ //for(Float t : T){
    PVector p = myBezier(T.get(i), p0, p1, p2, p3);
    fill(255);
    ellipse(p.x, p.y, 20, 20);
    fill(0);
    textSize(20);
    //text(""+i, p.x, p.y);
  }
}
void mousePressed(){
  T.append(0);
  for(int i=T.size()-1-1; i>=0; i--){
    float newT = myNextT(T.get(i+1), p0, p1, p2, p3, 20);
    T.set(i, newT);
  }
}
float myNextT(float t0, PVector p0, PVector p1, PVector p2, PVector p3, float d){
  PVector prev = myBezier(t0, p0, p1, p2, p3);
  for(float f = t0; f<=1; f+=0.001){
    PVector p = myBezier(f, p0, p1, p2, p3);
    if(dist(p.x, p.y, prev.x, prev.y) >= d){
      return f;
    }
  }
  return 1;
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
