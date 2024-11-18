// week11_09_zuma_curve_animation
PImage imgBG;
void setup(){
  size(520, 390);
  imgBG = loadImage("zuma_bg.png");
}
ArrayList<PVector> curve = new ArrayList<PVector>();
int pos = 0, startAnimation = 0;
void draw(){
  background(imgBG);
  for(PVector p : curve){
    //ellipse(p.x, p.y, 10, 10);
  }  
  if(startAnimation==1 && pos<curve.size()-1) pos++;
  if(pos<curve.size()) ellipse( curve.get(pos).x, curve.get(pos).y, 30, 30); 
}
void mouseReleased(){
  startAnimation = 1;
}
void mouseDragged(){
  curve.add(new PVector(mouseX, mouseY));
}
