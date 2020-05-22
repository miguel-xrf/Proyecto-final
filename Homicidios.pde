import oscP5.*;
import netP5.*;
//import processing.sound.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

PImage fondo;
PImage city;
PImage calle;
PImage vivo;
PImage muerto;
Persona persona, persona2, persona3;
ArrayList <Persona> personas;
int p;

/*
SoundFile file;
SoundFile file2;
String CitySound = "Sonido_ambiental.mp3";
String shot = "Disparo.mp3";
String path;
String path2;
*/

void setup() {
  size(800, 700);
  fondo = loadImage("fondo.png");
  city = loadImage("edificios.png");
  calle = loadImage("calle.png");
  vivo = loadImage("persona1.png");
  muerto = loadImage("persona2.png");  

  persona = new Persona(0,440,4,5); // xPos, yPos, velocidad, tamaño
  persona2 = new Persona(0,460,3,4);
  persona3 = new Persona(0,500,2,3);
  
  oscP5 = new OscP5(this,12001);
  personas = new ArrayList<Persona>();
  personas.add(persona);
  personas.add(persona2);
  personas.add(persona3);

  /*
//  path = sketchPath(CitySound);
  file = new SoundFile(this, "gente.mp3");
//  path2 = sketchPath(shot);
  file2 = new SoundFile(this, "balazo.mp3");
  file.play();
  */
}

void draw() {
  background(fondo);
  image(calle,0,0);
  image(city,0,0);

  for(Persona p: personas){
    p.display();
    p.caminar();
  }  
    
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/p") == true) {
    //asigna el valor entero a la variable x
    p = theOscMessage.get(0).intValue();
  }
  
  if (theOscMessage.checkAddrPattern("/y") == true) {
    //asigna el valor entero a la variable x
    int y = theOscMessage.get(0).intValue();
    personas.get(p).yPos = y;
  }
  
  if (theOscMessage.checkAddrPattern("/v") == true) {
    //asigna el valor entero a la variable x
    int v = theOscMessage.get(0).intValue();
    personas.get(p).xVel = v;
  }
  
  if (theOscMessage.checkAddrPattern("/t") == true) {
    //asigna el valor entero a la variable x
    int t = theOscMessage.get(0).intValue();
    personas.get(p).Tam = t;
  }
  
}
