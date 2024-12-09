ArrayList<Point> rain=null;
PImage imgBottle;
class Point{
  int x, y;
  int state=0;//0:free, 1: 
  Point(int _x, int _y){
    x=_x; y=_y;
  }
  void testDown(){
    if(y+1<H-1){//easy test: down, down-left, down-right
      if(map2[x][y+1]==0){//down
        map2[x][y]=0;//empty
        y=y+1; 
        map2[x][y]=2;//moving
        return;
      }else if(x-1>=0 && map2[x-1][y+1]==0){//down-left
        map2[x][y]=0;//empty
        x=x-1;y=y+1; 
        map2[x][y]=2;//moving
        return;
      }else if(x+1<W && map2[x+1][y+1]==0){//down-right
        map2[x][y]=0;//empty
        x=x+1;y=y+1;
        map2[x][y]=2;//moving
        return;
      }
    }
    
    if(y+1<H-1){//difficult test: cross empty(0) and moving(2) cell, test its lower cell
      int goLeft=1, goRight=1;
      for(int diff=0; goLeft==1||goRight==1; diff++){
        int x2=x-diff;
        if(goLeft==1 && x2>=0 && x2<W && (map2[x2][y]==0||map2[x2][y]==2)){
          if(map2[x2][y+1]==0){//got empty cell (arrivable in next level)
            map2[x][y]=0;//empty
            x=x2; y=y+1;
            map2[x2][y]=2;//moving
            return;
          }
        }else goLeft=0;
        x2=x+diff;
        if(goRight==1 && x2>=0 && x2<W && (map2[x2][y]==0||map2[x2][y]==2)){
          if(map2[x2][y+1]==0){//got empty cell (arrivable in next level)
            map2[x][y]=0;//empty
            x=x2; y=y+1;
            map2[x2][y]=2;//moving
            return;
          }          
        }else goRight=0;
      }
    }
    state=1; map2[x][y]=1;
    return;
  }
  void update(){
    if(state==0){
      testDown();
    }
  }
}

PImage imgBG, imgFill;
int [][] map2;
int W, H;
void setup(){
  size(663,620);//based on width*height of fill.png
  rain = new ArrayList<Point>();
  imgBottle=loadImage("bottle.png");
  imgBG=loadImage("opaycup.png");
  W=imgBG.width; 
  H=imgBG.height;
  W=663; H=620;
  imgBG.loadPixels();
  imgFill=createImage(W,H, ARGB);
  imgFill.loadPixels();
  map2=new int[W][H];
  for(int x=0;x<W;x++){
    for(int y=0;y<H;y++){
      float V = imgBG.pixels[x+y*W]>> 8 & 0xFF;
      if(V<100){
        map2[x][y]=1;
        imgFill.pixels[x+y*W]=color(0,0,255);
      }else{
        map2[x][y]=0;
        imgFill.pixels[x+y*W]=color(0,0);
      }
    }
    map2[x][H-1]=1;
  }
  imgFill.updatePixels();
}
void draw(){
  background(imgBG);
  image(imgFill, 0,0);
  image(imgBottle, mouseX-10, mouseY+10-imgBottle.height);
  for(Point pt : rain){
    stroke(255);
    point(pt.x, pt.y);//ellipse(pt.x, pt.y, 10,10);
    pt.update();
  }
  //println(rain.size());
  imgFill.loadPixels();
  while(rain.size()>0 && rain.get(0).state==1){
    Point pt = rain.get(0);
    imgFill.pixels[pt.x + W*pt.y]=color(255,237,127);
    
    rain.remove(0);
  }
  imgFill.updatePixels();
  
  if(mousePressed){
    for(int x=-2;x<=3;x++){
      if(mouseX+x>=0 && mouseX+x<W) rain.add( new Point(mouseX+x, mouseY) );
    }
  }
  fill(0); text(rain.size(), 100,100);
  text(imgBG.width+"x"+imgBG.height, 100,200);
}
