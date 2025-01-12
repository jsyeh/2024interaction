// week18_12_zuma_bezier_curve_shooting_ballX_ballY_ballVX_ballVY_testAndStick
ArrayList<Float> T = new ArrayList<Float>(); //FloatList T = new FloatList();
ArrayList<Integer> C = new ArrayList<Integer>(); //IntList C = new IntList();
ArrayList<Integer> animT = new ArrayList<Integer>(); // 定時炸彈
color [] cc = {#FF0000, #FFA600, #FEFF00, #00FF0A, #0028FF}; // 5種色彩的寶石
int mouseC;
float mouseT;
int CN = 5; // color number
void setup(){
  size(500,500);
  mouseC = int(random(CN));
  T.add(new Float(0)); //T.append(0);  // T[i] 的球，會對應 C[i] 的色彩
  C.add(new Integer(int(random(CN))) );//C.append( int(random(5)) ); // 挑1個色彩
  animT.add(new Integer(0)); // 定時炸彈
}
PVector p0 = new PVector(340, 80);
PVector p1 = new PVector(40, 40);
PVector p2 = new PVector(360, 360);
PVector p3 = new PVector(60, 320);
float ballX = 400, ballY = 400, ballVX = 0, ballVY = 0; // week18_12
boolean shooting = false; // week18_12
PVector mp = new PVector(); // week18_12
void draw(){
  background(#FFFFF2);
  noFill();
  bezier(340, 80, 40, 40, 360, 360, 60, 320);
  
  fill( cc[mouseC] );
  ellipse(ballX, ballY, 30, 30); //ellipse(mouseX, mouseY, 30, 30); // week18_12
  if(shooting==false) line(mouseX, mouseY, ballX, ballY); // week18_12
  else{ // week18_12  // shooting
    ballX += ballVX; // 如果 shooting 就更新球的位置
    ballY += ballVY;
    if(ballX<0 || ballY <0 || ballX>500 || ballY>500){ // 飛超過範圍
      shooting = false; // 還原
      ballX = 400;
      ballY = 400;
    }
    mouseT = myNearestBezierT(ballX, ballY, p0, p1, p2, p3);
    mp = myBezier(mouseT, p0, p1, p2, p3);
    //if(dist(ballX, ballY, mp.x, mp.y) < 30){ // week18_12
    //  ellipse(mp.x, mp.y, 30, 30);
    //}
  }
  
  for(int i=0; i<T.size(); i++){ //for(Float t : T){
    PVector p = myBezier(T.get(i), p0, p1, p2, p3);
    fill( cc[C.get(i)] );
    ellipse(p.x, p.y, 30, 30);
    fill(0);
    textSize(10);
    text(""+i, p.x, p.y);
    String t = nf(T.get(i),0,2);
    text(t, p.x, p.y+30);
    
    if(shooting){ // week18_12
      float d2 = dist(ballX, ballY, p.x, p.y);
      float d = dist(mp.x, mp.y, p.x, p.y);
      if(mouseT>T.get(i) && d>0 && d<30 && d2<30){
        insertI = i;
        testAndStick();
      }
    }
    if(animT.get(i)>0){ // 正的,代表有炸彈 if(animT[i]>0)
      animT.set(i, animT.get(i)-1); // animT[i] = animT[i] - 1倒數計時 定時炸彈
      if(animT.get(i)==0) { // 倒數到變成0時, 就炸掉 if(animT[i]==0)
        T.remove(i); // 消掉
        C.remove(i); // 消掉
        animT.remove(i); // 消掉
      }
    }
  }
  if(T.size()>0){
    int lastI = T.size()-1; // 整數，第i個 是最後一個 index i T[i]
    float lastT = T.get(lastI); // T[0] T[1] T[i]
    T.set(lastI, lastT+0.0001); //把最後加入的點，加大一些些 T[i] = T[i] + 0.0001
    if(lastT >= myNextT(0, p0, p1, p2, p3, 30)) {
      T.add(new Float(0)); //T.append(0);  // T[i] 的球，會對應 C[i] 的色彩 //空間夠多，就再塞一個0在最後
      C.add(new Integer(int(random(CN))) );//C.append( int(random(5)) ); // 挑1個色彩
      animT.add(new Integer(0));  // 定時炸彈
    }
    myMoveAll_T_Slowly();
  }else{
    T.add(new Float(0)); //T.append(0);  // T[i] 的球，會對應 C[i] 的色彩 //空間夠多，就再塞一個0在最後
    C.add(new Integer(int(random(CN))) );//C.append( int(random(5)) ); // 挑1個色彩
    animT.add(new Integer(0)); // 定時炸彈
  }
}
int insertI = -1;
void mousePressed(){
  if(shooting==false){ // week18_12
    PVector v = new PVector(mouseX - ballX, mouseY - ballY);
    v.normalize();
    ballVX = v.x * 3;
    ballVY = v.y * 3;
    shooting = true; // week18_12
  }
  // testAndStick() 把黏起來的程式，移到外面
}
void testAndStick(){ // week18_12 抄自 mousePressed()裡的
  if(insertI != -1){
    T.add(insertI, mouseT);
    C.add(insertI, mouseC);
    animT.add(insertI, new Integer(0));  // 定時炸彈
    mouseC = int(random(CN));
    // combo remove
    int right = insertI, left = insertI;
    int nowC = C.get(insertI);
    for(int i=insertI; i<C.size(); i++){ // 往右看，有幾個和我相同
      if(nowC==int(C.get(i))) right = i; // 相同
      else break; // 不相同
    }
    for(int i=insertI; i>=0; i--){ // 往左看，有幾個和我相同
      if(nowC==int(C.get(i))) left = i; // 相同
      else break; // 不相同
    }
    println(left, right);
    if(right-left >= 2){ // 相同的夠多個，就全部消掉
      for(int k = left; k<=right; k++){
        animT.set(k, new Integer(60)); // 安放定時炸彈
      }
      //for(int k=0; k<=right-left; k++){ // 不馬上消掉
        //T.remove(left); // 消掉
        //C.remove(left); // 消掉
        //latter!!!
      //}
    }
    insertI = -1;
    ballX = 400; // week18_12
    ballY = 400; // week18_12
    shooting = false;
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
