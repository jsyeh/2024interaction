// week04_1_PShape_loadShape_shape
// google: taiwan svg 下載 svg 檔(檔案總管-檢視-副檔名)
//PImage img = loadImage("image.jpg"); //上週教的
//image(img, 0, 0); // week03_1_PImage_loadImage_image
size(500, 500);
//本週要教的 PShape loadShape shape
PShape taiwan = loadShape("Taiwan-icon.svg"); 
PShape taiwan2 = loadShape("tw.svg"); //第2張svg圖檔
shape(taiwan);
shape(taiwan2);
