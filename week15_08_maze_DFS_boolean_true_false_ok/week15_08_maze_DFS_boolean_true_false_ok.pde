// week15_08_maze_DFS_boolean_true_false_ok
int [][] maze = {
  {1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,1,0,0,0,1,1},
  {1,1,0,1,1,0,1,0,1,1},
  {1,0,0,0,1,0,1,0,1,1},
  {1,0,1,1,0,0,1,0,1,1},
  {1,0,1,1,0,1,1,0,1,1},
  {1,0,0,0,0,1,1,0,1,1},
  {1,1,1,1,1,1,1,0,1,1},
  {1,0,0,0,0,0,0,0,0,1},
  {1,1,1,1,1,1,1,1,1,1},
};
int [][] visited = new int[10][10];
int startI = 1, startJ = 1, I = 1, J = 1, step = 1;
void setup(){
  size(400,400);
  //visited[I][J] = step;
}
void draw(){
  for(int i=0; i<maze.length; i++){
    for(int j=0; j<maze[0].length; j++){
      if(maze[i][j]==1) fill(0);
      else fill(255);
      rect(j*40, i*40, 40, 40);
    }
  }
  fill(255,0,0);
  rect(startJ*40, startI*40, 40, 40);
  for(int i=0; i<maze.length; i++){
    for(int j=0; j<maze[0].length; j++){
      if(visited[i][j]>0) {
        fill(0,0,255);
        text(""+visited[i][j], j*40+20, i*40+20);
      }
    }
  }
}
boolean DFS(int i, int j, int s) {
  if( i==8 && j==8 ) return true; //走到目的地
  if( maze[i][j]==1 ) return false; //擋住,不能走
  if( visited[i][j] > 0 ) return false; //走過,不要再走
  visited[i][j] = s; // 現插旗子,表示走到這裡
  if( DFS(i+1, j, s+1) ) return true;
  if( DFS(i-1, j, s+1) ) return true;
  if( DFS(i, j+1, s+1) ) return true;
  if( DFS(i, j-1, s+1) ) return true;
  visited[i][j] = 0;
  return false;
}
void mousePressed(){ // 按下mouse會往右 or 往下走
  visited[1][1] = 0;
  DFS( 1, 1, 1 );
}
