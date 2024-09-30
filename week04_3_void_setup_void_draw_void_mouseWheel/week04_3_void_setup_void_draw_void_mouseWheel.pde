// week04_3_void_setup_void_draw_void_mouseWheel
PShape taiwan, taiwan2; //宣告變數
void setup(){
  size(500, 500);
  taiwan = loadShape("Taiwan-icon.svg"); //讀入 svg 
  taiwan2 = loadShape("tw.svg"); //第2張svg圖檔
}
float taiwanScale = 1;
void draw(){
  background(#92C2F5);
  pushMatrix();
    scale(10*taiwanScale);
    shape(taiwan);
  popMatrix();
  pushMatrix();
    scale(0.5*taiwanScale);
    shape(taiwan2);
  popMatrix();
}
void mouseWheel(MouseEvent e){ //mouseWheel 是mouse的滾輪
  float d = e.getCount();
  if(d>0) taiwanScale *= 1.1;
  else taiwanScale *= 0.9;
}
