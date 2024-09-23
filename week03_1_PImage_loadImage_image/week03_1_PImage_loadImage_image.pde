// week03_1_PImage_loadImage_image
// 把 File-Preference 字型設大一點
// 把網路下載的 arufa.jpg 拉到程式的框框裡
PImage img = loadImage("arufa.jpg");
size(600, 400);  // 因為圖檔的大小,剛好是600x400所以開600,400
image(img, 0, 0);
