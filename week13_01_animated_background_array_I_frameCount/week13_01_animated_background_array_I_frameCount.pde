// week13_01_animated_background_array_I_frameCount
PImage [] img = new PImage[3];
void setup(){
  size(550,370);
  img[0] = loadImage("snail01.png");
  img[1] = loadImage("snail02.png");
  img[2] = loadImage("snail03.png");  
}
int I = 0; //0,1,2,0,1,2,0,1,2...
void draw(){
  background(img[I]);
  if(frameCount%20==0) I = (I+1)%3;
}
