// week14_04_draw_lines_rain_ArrayList_PVector_p_pp
PImage img;
void setup(){
  size(500, 500);
  img = createImage(500, 500, RGB);
} //換黑背景, 可以用 mouse 刮出彩色的線條
//int x = 250, y = 0;
ArrayList<PVector> p = new ArrayList<PVector>(); //很多個點p
void draw(){
  background(img);
  for(PVector pp : p){
    ellipse( pp.x, pp.y, 20, 20);
    if(pp.y<498 && img.pixels[int(pp.x)+int(pp.y)*500]==-16777216) pp.y++;  
  }
}
void mouseDragged(){
  background(img);
  stroke( random(255), random(255), random(255) );
  line(mouseX, mouseY, pmouseX, pmouseY);
  loadPixels();
  img.loadPixels();
  for(int i=0; i<500*500; i++) img.pixels[i] = pixels[i];
  img.updatePixels();
  updatePixels();
  for(PVector pp : p){
    ellipse(pp.x, pp.y, 20, 20);
  }
}
void mousePressed(){
  if(mouseButton==RIGHT){
    p.add( new PVector(mouseX, mouseY) );
  }
}
