import processing.serial.*;
Serial myPort;
String val;
PrintWriter output;

void setup(){
  String portName = Serial.list()[10];      // or whatever port Arduino is on
  myPort = new Serial(this, portName, 9600);
  output = createWriter("data3.txt");
}

void draw(){
  if (myPort.available() > 0){
    val = myPort.readStringUntil('\n');
  }
  println(val);
  if (val != null){
    output.println(val);
  }
}

void keyPressed(){
  output.flush();
  output.close();
  exit();
}