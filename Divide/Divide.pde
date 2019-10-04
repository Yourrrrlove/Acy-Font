import java.awt.FileDialog;
import java.awt.Frame;

final int nx=20,ny=25;//横向，纵向分别有多少块
String fileName;

void setup(){
  FileDialog fd=new FileDialog(new Frame(),"打开",FileDialog.LOAD);
  fd.setVisible(true);
  if(fd.getFiles().length>0){
    fileName=fd.getFile();
    DivideImage(fd.getDirectory()+fileName);
  }
  exit();
}

void DivideImage(String path){
  PImage img=loadImage(path);
  int dw=img.width/nx;
  int dh=img.height/ny;
  PImage charImg=createImage(dw,dh,255);
  charImg.loadPixels();
  for(int j=0;j<ny;j++){
    for(int i=0;i<nx;i++){
      charImg.copy(img,i*dw,j*dh,dw,dh,0,0,dw,dh);
      String fn=String.format("%s_%02d_%02d.png",fileName.substring(0,fileName.lastIndexOf(".")),j,i);
      charImg.save(fn);
    }
  }
}
