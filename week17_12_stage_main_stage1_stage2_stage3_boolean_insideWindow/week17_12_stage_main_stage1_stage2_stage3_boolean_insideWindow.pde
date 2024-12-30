// week17_12_stage_main_stage1_stage2_stage3_boolean_insideWindow
// 換不同的關卡, 也有主選單
int stage = 0; // 0:main, 1:stage1, 2:stage2, 3:stage3
void setup(){
  size(500,500);
}
int W = 10;
void draw(){
  if(stage==0){ // main選單
    background(#FFFFF2);
    if(insideWindow(50, 200, 100, 100)){
      rect(50-W, 200-W, 100+W*2, 100+W*2);
      if(mousePressed) stage = 1;
    }else rect(50, 200, 100, 100);
   
    if(insideWindow(200, 200, 100, 100)){
      rect(200-W, 200-W, 100+W*2, 100+W*2);
      if(mousePressed) stage = 2;
    }else rect(200, 200, 100, 100);
    
    if(insideWindow(350, 200, 100, 100)){
      rect(350-W, 200-W, 100+W*2, 100+W*2);
      if(mousePressed) stage = 3;
    }else rect(350, 200, 100, 100);
  } else if(stage==1){
    background(255,0,0);
    rect(0,0,100,100);
    if(insideWindow(0,0,100,100) && mousePressed) stage=0;
  } else if(stage==2){
    background(0,255,0);
    rect(0,0,100,100);
    if(insideWindow(0,0,100,100) && mousePressed) stage=0;
  } else if(stage==3){
    background(0,0,255);
    rect(0,0,100,100);
    if(insideWindow(0,0,100,100) && mousePressed)  stage=0;
  }
}
boolean insideWindow(int x, int y, int w, int h){
  if(x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h) return true;
  return false;
}
