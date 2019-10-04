void setup(){
  PImage mt=createImage(8000,10000,RGB);
  mt.loadPixels();
  for(int y=0;y<10000;y++){
    for(int x=0;x<8000;x++){
      if(x%400==0||y%400==0){
        mt.set(x,y,color(200,91,252));
      }else{
        mt.set(x,y,color(255,255,255));
      }
    }
  }
  println("Save result:",mt.save("bg.png"));
  exit();
}
