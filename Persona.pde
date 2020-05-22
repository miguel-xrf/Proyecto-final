class Persona{
  
  int xPos;
  int yPos;
  int xVel;
  int Tam;
  
  Persona(int xPos_aux, int yPos_aux, int xVel_aux, int Tam_aux){
    xPos=xPos_aux;
    yPos=yPos_aux;
    xVel=xVel_aux;
    Tam=Tam_aux;
  }
  
  void display(){   
     image(vivo,xPos,yPos,vivo.width/Tam, vivo.height/Tam);
     if(xVel==0){
      image(muerto,xPos,yPos,vivo.width/Tam, vivo.height/Tam);
//      file2.play();
     }     
   }

  void caminar(){
    if(xPos<=width){
      xPos=xPos+xVel;
    }
    else{
      xPos=0;
    }
  }
  
}
