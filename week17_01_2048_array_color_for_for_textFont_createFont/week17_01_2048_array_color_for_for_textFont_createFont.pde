// week17_01_2048_array_color_for_for_textFont_createFont
// 目標:2048的遊戲
void setup(){
  size(300,300);
  //textSize(50);
  textAlign(CENTER,CENTER);
  PFont font = createFont("SansSerif.bold", 50);
  textFont(font);
  //for(String s : PFont.list()) println(s);
  grid[0][0] = 1;
  grid[1][1] = 1;
  grid[2][0] = 2;
}
color [] c = {#BBACA0, #EEE3DA, #EDDFC8, #FFCAAB, #FFA78A, #FF846A, #FF614C};
color [] c2 = {#907A68, #907A68, #907A68, #907A68, #907A68, #FFFFFF, #FFFFFF};
int [] n = {0,2,4,8,16,32,64,128,256,512,1024,2048,4096};
//int [][] grid = new int[4][4];
int[][] grid = {
  {0,1,2,3},
  {1,2,3,4},
  {2,3,4,5},
  {3,4,5,6}
};
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
