// week06_2_schulte_table02_for_for_fill_rect_fill_text
void setup(){
  size(500,500);
  textSize(50);
  textAlign(CENTER,CENTER);
}
void draw(){
  for(int i=0; i<5; i++){ //對y座標
    for(int j=0; j<5; j++){ //對x座標
      fill(255); rect(j*100, i*100, 100, 100);
      fill(0); text("1", 50+j*100, 50+i*100);
    }
  }
}
