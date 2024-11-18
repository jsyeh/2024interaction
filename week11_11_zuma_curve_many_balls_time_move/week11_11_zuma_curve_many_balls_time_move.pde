// week11_11_zuma_curve_many_balls_time_move
PImage imgBG;
void setup(){
  size(520, 390);
  imgBG = loadImage("zuma_bg.png");
}
ArrayList<PVector> curve = new ArrayList<PVector>();
ArrayList<Integer> balls = new ArrayList<Integer>();
int pos = 0, startAnimation = 0;
color [] c = {#F7A5A5, #F7E7A5, #B6F7A5, #A5A8F7};
void draw(){
  background(imgBG);
  for(int i=0; i<balls.size(); i++){
    PVector p = curve.get(balls.get(i));
    fill(c[i%4]);
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
}
void time_move(){
  int N = balls.size();
  if(N>0) balls.set(N-1, balls.get(N-1)+1); //每次走一點點
  for(int i = balls.size() - 2; i>=0; i--){ //每個人,要推下一個
    while(myDist(balls.get(i), balls.get(i+1))<30) balls.set(i, balls.get(i)+1);
  } // 距離不夠遠, 就會一直往下推
}
void mouseDragged(){
  curve.add(new PVector(mouseX, mouseY));
}
