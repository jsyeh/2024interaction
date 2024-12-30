// week17_03_2048_void_keyPressed_keyCode_LEFT_for_for_left_temp
// 目標:2048的遊戲
void setup(){
  size(300,300);
  textAlign(CENTER,CENTER);
  PFont font = createFont("SansSerif.bold", 50);
  textFont(font);
}
color [] c = {#BBACA0, #EEE3DA, #EDDFC8, #FFCAAB, #FFA78A, #FF846A, #FF614C};
color [] c2 = {#907A68, #907A68, #907A68, #907A68, #907A68, #FFFFFF, #FFFFFF};
int [] n = {0,2,4,8,16,32,64,128,256,512,1024,2048,4096};
int [][] grid = new int[4][4];
int usedGrid = 0; // 一開始用了 0 個格子
void mousePressed(){
  randomOne();
}
void keyPressed(){
  if(keyCode==LEFT){
    int [] left = new int[4];
    for(int i=0; i<4; i++){
      for(int j=0; j<4; j++){
        if(grid[i][j]!=0){ // 遇到不是0的, 要往左邊放
          int temp = grid[i][ left[i] ];
          grid[i][ left[i] ] = grid[i][j];
          grid[i][j] = temp;
          left[i]++;
        }
      }
    }
  }else if(keyCode==RIGHT){
    
  }else if(keyCode==UP){
    
  }else if(keyCode==DOWN){
    
  }
  
}
void randomOne(){ // 2^1 = 2
  int r = int(random(16-usedGrid)); //現在決定第幾個空格, 要放 2^1 即 2
  println(r, usedGrid);
  usedGrid++;
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      if(grid[i][j]!=0) continue; //已經有數值的, 不可以放哦,換下一格
      if(r==0) {
        grid[i][j] = 1;
        return;
      } else  r--;
    }
  }
}
void draw(){
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      strokeWeight(8);
      int g = grid[i][j];
      fill(c[g]);
      rect(j*75, i*75, 75, 75);
      fill(c2[g]);
      text(""+n[g], j*75+38, i*75+38);
    }
  }
}
