// week06_3_schulte_table03_random_2d_array_table
int [][] table = new int[5][5]; //Java的陣列宣告
void setup(){
  size(500,500);
  textSize(50);
  textAlign(CENTER,CENTER);
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      table[i][j] = int(random(1,26)); //方法不對,會有重覆的、缺漏的
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
