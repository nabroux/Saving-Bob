int colorOfShadow = -345211;
int colorOfEar = -411004;
int colorOfFace = -275814;
int colorOfMouth = -2933443;
int acne1Size = 30;
int acne2Size = 45;
int acne3Size = 60;
int acne4Size = 70;

//Some Function    
boolean isAddable(int x,int y){
  
  int location = x+(y*width); 
  if(location>1021000||location<0){
    return false;
   }
  color positionColor =pixels[location];
    if(positionColor != colorOfShadow &&
       positionColor != colorOfMouth &&
       positionColor == colorOfEar ||
       positionColor == colorOfFace)
    {
      return true;
  } return false;   
}

void killOneAcne(){
  if(getNumOfAcne()>0){
    int newIndex = (int)random(0,acneList.length);
    while(acneList[newIndex]==null){
    newIndex = (int)random(0,acneList.length);
    }
    if(acneList[newIndex].acneLevel>1){
      acneList[newIndex].acneLevel-=2;
    }else{
      acneList[newIndex]=null;
    }
  }

}

void generateAcne(int level1,int level2){
  int newX = (int)random(width);
  int newY = (int)random(height);
  int newLv = (int)random(level1,level2);
  int newSize;
  if(newLv>=4){
      newSize = acne4Size;
      }else if(newLv==3){
      newSize = acne3Size;
      }else if(newLv==2){
      newSize = acne2Size;
      }else if(newLv== 1){
      newSize = acne1Size;
      }else {
      newSize = acne1Size;
      }
  while(
        //mouth
        isAddable(newX-(int)((newSize)*3/8),newY)==false||
        isAddable(newX+(int)((newSize)*3/8),newY)==false||
        isAddable(newX,newY+(int)((newSize)*3/8))==false||
        isAddable(newX,newY-(int)((newSize)*3/8))==false||
        isAddable(newX-(int)((newSize)/4),newY)==false||
        isAddable(newX+(int)((newSize)/4),newY)==false||
        isAddable(newX,newY+(int)((newSize)/4))==false||
        isAddable(newX,newY-(int)((newSize)/4))==false||
        isAddable(newX-(int)((newSize)/8),newY)==false||
        isAddable(newX+(int)((newSize)/8),newY)==false||
        isAddable(newX,newY+(int)((newSize)/8))==false||
        isAddable(newX,newY-(int)((newSize)/8))==false||
        //UDLRC
        isAddable(newX,newY)==false||
        isAddable(newX+(newSize)/2,newY)==false||
        isAddable(newX-(newSize)/2,newY)==false||
        isAddable(newX,newY+(newSize)/2)==false||
        isAddable(newX,newY-(newSize)/2)==false||
        //corner
        isAddable(newX+(newSize)/2,newY+(newSize)/2)==false||
        isAddable(newX-(newSize)/2,newY+(newSize)/2)==false||
        isAddable(newX+(newSize)/2,newY-(newSize)/2)==false||
        isAddable(newX-(newSize)/2,newY-(newSize)/2)==false)
         {
          newX = (int)random(width);
          newY = (int)random(height);   
          newLv = (int)random(level1,level2);
         } 
  //check acne array
    for(int i=0;i<acneCounter;i++){
      if(acneList[i]!=null){
      continue;
      }else{  
      acneList[i] = new Acne(newLv,newX,newY);
      return;
    }
  }
  //current array is full
  acneList[acneCounter] = new Acne(newLv,newX,newY);
  acneCounter++;
}

void beatAcne(){
  if(medMode==false){
    for(int i=0;i<acneCounter;i++){
      if(acneList[i]!=null){
      
          if(acneList[i].acneLevel==5){
            if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne4Size/2){
            acneList[i].acneLevel=6;
            wrong.trigger();
            }
          }else if(acneList[i].acneLevel==4){
            if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne4Size/2){
            acneList[i].acneLevel-=1;
            po.trigger();
            }
          }else if(acneList[i].acneLevel==3){
            if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne3Size/2){
            acneList[i].acneLevel-=1;
            po.trigger();
            }
          }else if(acneList[i].acneLevel==2){
            if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne2Size/2){
            acneList[i].acneLevel-=1;
            po.trigger();
            }
          }else if(acneList[i].acneLevel==1){
            if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne1Size/2){
            acneList[i].acneLevel-=1;
            po.trigger();
            }
          }else{
           //do nothing  
          }
        }//if empty
       }//for loop end
      }else{
        for(int i=0;i<acneCounter;i++){
         if(acneList[i]!=null){
           if(acneList[i].acneLevel==5){
              if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne4Size/2){
              acneList[i].acneLevel=4;
              heal.trigger();
              }
           }else if(acneList[i].acneLevel==0){
              if(dist(mouseX,mouseY,acneList[i].acneX,acneList[i].acneY)<=acne1Size/2){
              acneList[i] = null;
              heal.trigger();
              }
            }
         }//if empty
      }//for loop end  
  }//med or finger      
}//function end

class Acne {
    int acneLevel,acneX,acneY;
    
    Acne(int lv,int acneX,int acneY){
      this.acneLevel=lv;
      this.acneX=acneX;
      this.acneY=acneY;
    }
   
  
    void displayAcne(int lv,int x,int y){
      imageMode(CENTER);
      
      if(lv==6){
      image(acneScar,x,y,acne4Size,acne4Size);
      }else if(lv==5){
      image(acne5,x,y,acne4Size,acne4Size);
      }else if(lv==4){
      image(acne4,x,y,acne4Size,acne4Size);
      }else if(lv==3){
      image(acne3,x,y,acne3Size,acne3Size);
      }else if(lv==2){
      image(acne2,x,y,acne2Size,acne2Size);
      }else if(lv== 1){
      image(acne1,x,y,acne1Size,acne1Size);
      }else {
      image(acne0,x,y,acne1Size,acne1Size);
      }
      
      imageMode(CORNER);
    }
  
  
}