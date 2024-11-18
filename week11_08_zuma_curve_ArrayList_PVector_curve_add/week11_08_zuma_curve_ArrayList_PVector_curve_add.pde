// week11_08_zuma_curve_ArrayList_PVector_curve_add
PImage imgBG;
void setup(){
  size(520, 390);
  imgBG = loadImage("zuma_bg.png");
}
ArrayList<PVector> curve = new ArrayList<PVector>();
void draw(){
  background(imgBG);
  for(PVector p : curve){
    ellipse(p.x, p.y, 10, 10);
  }
}
void mouseDragged(){
  curve.add(new PVector(mouseX, mouseY));
}
