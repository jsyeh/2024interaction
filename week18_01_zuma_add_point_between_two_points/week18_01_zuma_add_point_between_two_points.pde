// week18_01_zuma_add_point_between_two_points
// modify from week11_11_
PImage imgBG;
void setup(){
  size(520, 390);
  imgBG = loadImage("zuma_bg.png");
}
ArrayList<PVector> curve = new ArrayList<PVector>();
ArrayList<Integer> balls = new ArrayList<Integer>();
ArrayList<Integer> colors = new ArrayList<Integer>();
int pos = 0, startAnimation = 0;
color [] c = {#F7A5A5, #F7E7A5, #B6F7A5, #A5A8F7};
void draw(){
  background(imgBG);
  for(int i=0; i<balls.size(); i++){
    PVector p = curve.get(balls.get(i));
    fill(c[colors.get(i)]);
    ellipse(p.x, p.y, 30, 30);
  }
  if(frameCount%10==0) time_move();
}
float myDist(PVector p0, PVector p1) {
  return dist(p0.x, p0.y, p1.x, p1.y);
}
float myDist(Integer i0, Integer i1) {
  return myDist(curve.get(i0), curve.get(i1));
}
void keyPressed() {
  balls.add(0);
  colors.add(int(random(4)));
}
void time_move(){
  int N = balls.size();
  if(N>0) balls.set(N-1, balls.get(N-1)+1); //每次走一點點
  for(int i = balls.size() - 2; i>=0; i--){ //每個人,要推下一個
    while(myDist(balls.get(i), balls.get(i+1))<30) {
      if(balls.get(i)+1>=curve.size()) return;
      balls.set(i, balls.get(i)+1);
    }
  } // 距離不夠遠, 就會一直往下推
}
void mouseDragged(){
  if(mouseButton==LEFT) curve.add(new PVector(mouseX, mouseY));
}
void mousePressed(){
  if(mouseButton==RIGHT){
    float minD1=Float.MAX_VALUE, minD2=Float.MAX_VALUE; // 最小 minD1, 次小 minD2
    int ii1 = 0, ii2 = 0;
    for(int i=0; i<balls.size(); i++){
      PVector p1 = curve.get(balls.get(i));
      float d = dist(p1.x, p1.y, mouseX, mouseY);
      if(d<=30){
        if(d<minD1){ //比最小還要小
          minD2 = minD1;
          minD1 = d;
          ii2 = ii1;
          ii1 = i;
        }else if(d<minD2) { // 介於2個的中間
          minD2 = d;
          ii2 = i;
        }
      }
    }
    println("ii1:", ii1);
    println("ii2:", ii2);
    ii1 = min(ii1,ii2);
    
    balls.add(ii1+1, balls.get(ii1)+1 ); // 要找到i是哪裡
    colors.add(ii1+1, 0); //紅色    
  }
}
