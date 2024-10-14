// week06_4_schulte_table04_no_repeat_used_array_while
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
void draw(){
  for(int i=0; i<5; i++){ //對y座標
    for(int j=0; j<5; j++){ //對x座標
      fill(255); rect(j*100, i*100, 100, 100);
      fill(0); text(""+table[i][j], 50+j*100, 50+i*100);
    }
  }
}
