// week18_1_zuma_bezier_curve
void setup(){
  size(500,500);
}
void draw(){
  background(#FFFFF2);
  noFill();
  bezier(340, 80, 40, 40, 360, 360, 60, 320);
  ellipse(340,80, 8,8);
}
