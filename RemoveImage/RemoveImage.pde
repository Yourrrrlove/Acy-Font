import java.awt.FileDialog;
import java.awt.Frame;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

void setup(){
  FileDialog fd=new FileDialog(new Frame(),"打开",FileDialog.LOAD);
  fd.setVisible(true);
  if(fd.getFiles().length>0){
    RemoveImageData(fd.getDirectory()+fd.getFile());
  }
}

void RemoveImageData(String fileName){
  byte[]data=loadBytes(fileName);
  String strData=new String(data);
  strData=strData.replaceAll("Back\\nImage2:(.*\\n)+?EndImage2\\n","");
  saveStrings(fileName,strData.split("\\r?\\n"));
  exit();
}
