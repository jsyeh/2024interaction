// week03_5_go_for_for_rect
size(450, 450);
background(220,179,92);
strokeWeight(2);
noFill();
for(int i=0; i<8; i++){
  for(int j=0; j<8; j++){
    rect(25 + j*50, 25 + i*50, 50, 50);
  }
}
