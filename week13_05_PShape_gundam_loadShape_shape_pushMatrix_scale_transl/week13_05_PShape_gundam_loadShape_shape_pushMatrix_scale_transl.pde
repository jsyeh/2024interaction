// week13_05_PShape_gundam_loadShape_shape_pushMatrix_scale_translate_rotate_popMatrix
PShape gundam;
void setup(){
  size(500, 500, P3D); //小心 P3D
  gundam = loadShape("Gundam.obj");
}
void draw(){
  background(#BBFF81); //淡綠色
  pushMatrix();
    translate(mouseX, mouseY);
    rotateY(radians(frameCount));
    rotate(radians(180));
    scale(10, 10, 10);
    shape(gundam, 0, 0); //shape(gundam, 0, 0, 250/2, 500/2);
  popMatrix();
}
