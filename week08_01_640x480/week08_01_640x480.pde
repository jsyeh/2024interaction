PImage img;
void setup(){
  img = loadImage("640x480.png"); //32x32, 20x15
  size(640,480);
  println(""+(480/15));
  println(""+640/32);
}
void draw(){
  background(img);
  for(int i=0; i<15; i++){
    for(int j=0; j<20; j++){
      noFill();
      stroke(0);
      rect(j*32, i*32, 32, 32);
    }
  }
  if(I>=0 && J>=0){
    stroke(255,0,0);
    rect(J*32, I*32, 32, 32);
  }
}
int I=-1, J = -1;
void mouseMoved(){
  J = mouseX / 32;
  I = mouseY / 32;
}
int N = 0;
void mousePressed(){
    
}
