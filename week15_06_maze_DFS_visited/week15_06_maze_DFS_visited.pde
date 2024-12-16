// week15_06_maze_DFS_visited
int [][] maze = {
  {1,1,1,1,1,1,1,1,1,1},
  {1,0,0,0,1,0,0,0,1,1},
  {1,1,0,1,1,0,1,0,1,1},
  {1,1,0,0,1,0,1,0,1,1},
  {1,1,1,0,0,0,1,0,1,1},
  {1,0,1,1,0,1,1,0,1,1},
  {1,0,0,0,0,1,1,0,1,1},
  {1,0,1,1,1,1,1,0,1,1},
  {1,0,0,0,0,0,1,0,0,1},
  {1,1,1,1,1,1,1,1,1,1},
};
int [][] visited = new int[10][10];
int startI = 1, startJ = 1, I = 1, J = 1, step = 1;
void setup(){
  size(400,400);
  visited[I][J] = step;
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
}
