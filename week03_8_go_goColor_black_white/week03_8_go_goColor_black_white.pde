// week03_8_go_goColor_black_white 切換黑、白、黑、白...
int goColor = -1; //-1:黑 +1:白 0:沒有棋子
int [][] board = new int[9][9]; // Java 2D 陣列,預設0
void setup(){
  size(450, 450);
}
void draw(){
  background(220,179,92);
  strokeWeight(2);
  for(int i=0; i<9; i++){
    line(25, 25 + i*50, 425, 25 + i*50);
    line(25 + i*50, 25, 25 + i*50, 425);
  }
  for(int i=0; i<9; i++){
    for(int j=0; j<9; j++){
      if(board[i][j]==0) continue; //不要畫
      if(board[i][j]==1) fill(255);
      if(board[i][j]==-1) fill(0);
      ellipse(25 + j*50, 25 + i*50, 45, 45);
    }
  }
  if(goColor==-1) fill(0, 128);
  else fill(255, 128);
  ellipse(mouseX, mouseY, 45, 45);
}
void mousePressed(){
  int i = mouseY/50, j = mouseX/50;
  board[i][j] = goColor; //-1:黑, +1:白色
  goColor = goColor * -1;
}
