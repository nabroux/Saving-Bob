int hCounter;
int currentHairIndex;


void detectHair(){
  if(haha[0].hairLife>0 && haha[1].hairLife==0 ){
    currentHairIndex=0;
  }else if(haha[1].hairLife>0 && haha[2].hairLife==0 ){
    currentHairIndex=1;
  }else if(haha[2].hairLife>0 && haha[3].hairLife==0 ){
    currentHairIndex=2;
  }else if(haha[3].hairLife>0 && haha[4].hairLife==0 ){
    currentHairIndex=3;
  }else if(haha[4].hairLife>0 && haha[5].hairLife==0 ){
    currentHairIndex=4;
  }else if(haha[5].hairLife>0){
    currentHairIndex=5;
  }
}

class Hair{
  int hairX,hairY;
  int hairLife;
  float angle;
  
  
  
  
  Hair(){
    
    hairLife = 0;
    
    int newhairX = (int)random(380,480);
    int newhairY = (int)random(200,350);
    
    this.hairX=newhairX;
    this.hairY=newhairY;
    this.angle=PI/random(4,40);
    
    
  }
  
  
  
  void grow(){
    if(haha[currentHairIndex].hairLife==3){
        haha[currentHairIndex+1].hairLife++;
    }else{
      haha[currentHairIndex].hairLife++;
    }
  }
  
  void shrink(){
    if(haha[currentHairIndex].hairLife==0){
        haha[currentHairIndex-1].hairLife--;
    }else{
      haha[currentHairIndex].hairLife--;
    }
  }
  void displayHair(){
      if(hairLife==3){
        image(hair,0,0,111,35);
      }else if(hairLife==2){
        image(hair,0,0,74,23);
      }else if(hairLife==1){
        image(hair,0,0,37,12);
      }else{
        image(hair,0,0,0,0);
      }
    }
  
}