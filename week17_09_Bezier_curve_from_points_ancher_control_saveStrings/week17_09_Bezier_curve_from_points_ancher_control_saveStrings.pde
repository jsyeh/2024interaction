// week17_09_Bezier_curve_from_points_ancher_control_saveStrings
ArrayList<PVector> pt = new ArrayList<PVector>();
ArrayList<PVector> ancher = new ArrayList<PVector>();
ArrayList<PVector> control = new ArrayList<PVector>();
void setup() {
  size(500, 500);
}
void draw() {
  background(200);
  fill(255);
  for (PVector p : pt) {
    //ellipse(p.x, p.y, 8, 8);
  }
  for(int i=0; i<pt.size(); i+=5){
    PVector p = pt.get(i);
    //rect(p.x, p.y, 10, 10);
  }
  fill(255, 0, 0);
  for(PVector p : ancher) {
    ellipse(p.x, p.y, 8, 8);
  }
  stroke(0, 255, 0);
  noFill();
  for(int i = 0; i+1 < control.size(); i+=2){
    PVector a0 = ancher.get(i), a3 = ancher.get(i+1);
    PVector c1 = control.get(i), c2 = control.get(i+1);
    bezier(a0.x, a0.y, c1.x, c1.y, c2.x, c2.y, a3.x, a3.y);
  }
  //bezier(0,256, 512, 0, 0, 0, 256, 256)
  stroke(0);
}
void mousePressed() {
  pt.add(new PVector(mouseX, mouseY));
}
void mouseDragged() {
  pt.add(new PVector(mouseX, mouseY));
}
void mouseReleased(){
  for(int i=0; i+15<pt.size(); i+=5){
    PVector p0 = pt.get(i+0);
    PVector p1 = pt.get(i+5);
    PVector p2 = pt.get(i+10);
    PVector p3 = pt.get(i+15);
    findControl(p0, p1, p2, p3);
  }
  mySaveAncherControl("bezier.txt");
}
void mySaveAncherControl(String filename) {
  int N = ancher.size() / 2;
  String [] list = new String[N];
  for(int i = 0; i+1 < control.size(); i+=2){
    PVector a0 = ancher.get(i), a3 = ancher.get(i+1);
    PVector c1 = control.get(i), c2 = control.get(i+1);
    list[i/2] = "" + a0.x + " " + a0.y + " " + c1.x + " " + c1.y + " " + c2.x + " " + c2.y + " " + a3.x + " " + a3.y;
  }
  saveStrings(filename, list);
  
}
void findControl(PVector p0, PVector p1, PVector p2, PVector p3) {
  // Assume we need to calculate the control
  // points between (x1,y1) and (x2,y2).
  // Then x0,y0 - the previous vertex,
  //      x3,y3 - the next one.
  float x0 = p0.x, y0 = p0.y;
  float x1 = p1.x, y1 = p1.y;
  float x2 = p2.x, y2 = p2.y;
  float x3 = p3.x, y3 = p3.y;
  
  float xc1 = (x0 + x1) / 2.0;
  float yc1 = (y0 + y1) / 2.0;
  float xc2 = (x1 + x2) / 2.0;
  float yc2 = (y1 + y2) / 2.0;
  float xc3 = (x2 + x3) / 2.0;
  float yc3 = (y2 + y3) / 2.0;

  float len1 = sqrt((x1-x0) * (x1-x0) + (y1-y0) * (y1-y0));
  float len2 = sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1));
  float len3 = sqrt((x3-x2) * (x3-x2) + (y3-y2) * (y3-y2));

  float k1 = len1 / (len1 + len2);
  float k2 = len2 / (len2 + len3);

  float xm1 = xc1 + (xc2 - xc1) * k1;
  float ym1 = yc1 + (yc2 - yc1) * k1;

  float xm2 = xc2 + (xc3 - xc2) * k2;
  float ym2 = yc2 + (yc3 - yc2) * k2;

  float smooth_value = 0.5;
  // Resulting control points. Here smooth_value is mentioned
  // above coefficient K whose value should be in range [0...1].
  float ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1;
  float ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1;

  float ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2;
  float ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2;
  control.add(new PVector(ctrl1_x, ctrl1_y));
  control.add(new PVector(ctrl2_x, ctrl2_y));
  ancher.add(p1);
  ancher.add(p2);
}
