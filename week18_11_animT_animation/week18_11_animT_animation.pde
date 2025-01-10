// week18_11_animT_animation
void setup(){
  size(500,500);
}
void draw(){
  background(#FFFFF2);
  if(animT>0){
    ellipse(250, 250, 100, 100);
    animT--;
  }
}
int animT = 0;
void mousePressed(){
  animT = 120;
}
