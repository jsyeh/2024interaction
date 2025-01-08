// week18_8_zuma_bezier_curve_mouseC_mouseT
FloatList T = new FloatList();
IntList C = new IntList();
color [] cc = {#FF0000, #FFA600, #FEFF00, #00FF0A, #0028FF}; // 5種色彩的寶石
int mouseC;
void setup(){
  size(500,500);
  mouseC = int(random(5));
  T.append(0);  // T[i] 的球，會對應 C[i] 的色彩
  C.append( int(random(5)) ); // 挑1個色彩
}
PVector p0 = new PVector(340, 80);
PVector p1 = new PVector(40, 40);
PVector p2 = new PVector(360, 360);
PVector p3 = new PVector(60, 320);
void draw(){
  background(#FFFFF2);
  noFill();
  bezier(340, 80, 40, 40, 360, 360, 60, 320);
  
  fill( cc[mouseC] );
  ellipse(mouseX, mouseY, 30, 30);
  float mouseT = myNearestBezierT(mouseX, mouseY, p0, p1, p2, p3);
  PVector mp = myBezier(mouseT, p0, p1, p2, p3);
  if(dist(mouseX, mouseY, mp.x, mp.y) < 30){
    ellipse(mp.x, mp.y, 30, 30);
  }
  
  for(int i=0; i<T.size(); i++){ //for(Float t : T){
    PVector p = myBezier(T.get(i), p0, p1, p2, p3);
    fill( cc[C.get(i)] );
    ellipse(p.x, p.y, 30, 30);
    //fill(0);
    //textSize(10);
    //text(""+i, p.x, p.y);
    //String t = nf(T.get(i),0,2);
    //text(t, p.x, p.y+30);
  }
  if(T.size()>0){
    int lastI = T.size()-1; // 整數，第i個 是最後一個 index i T[i]
    float lastT = T.get(lastI); // T[0] T[1] T[i]
    T.set(lastI, lastT+0.0001); //把最後加入的點，加大一些些 T[i] = T[i] + 0.0001
    if(lastT >= myNextT(0, p0, p1, p2, p3, 30)) {
      T.append(0); //空間夠多，就再塞一個0在最後
      C.append( int(random(5)) ); // 挑1個色彩
    }
    myMoveAll_T_Slowly();
  }
}
void myMoveAll_T_Slowly(){
  for(int i=T.size()-1-1; i>=0; i--){
    float newT = myNextT(T.get(i+1), p0, p1, p2, p3, 30);
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
