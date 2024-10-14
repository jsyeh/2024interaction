// week06__5_schulte_table05_void_mousePressed_pressed_i_j
int [] used = new int[26]; //0...25 共26個
int [][] table = new int[5][5]; //Java的陣列宣告
void setup(){
  size(500,500);
  textSize(50);
  textAlign(CENTER,CENTER);
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      int now = int(random(1,26));
      while(used[now]==1) now = int(random(1,26));
      table[i][j] = now;
      used[now] = 1;
    }
  }
}
int [][] pressed = new int[5][5];
void draw(){
  for(int i=0; i<5; i++){ //對y座標
    for(int j=0; j<5; j++){ //對x座標
      if(pressed[i][j]==1) fill(128);
      else fill(255);
      rect(j*100, i*100, 100, 100);
      fill(0); text(""+table[i][j], 50+j*100, 50+i*100);
    }
  }
}
void mousePressed(){
  int i = mouseY/100, j = mouseX/100;
  pressed[i][j] = 1;
}
