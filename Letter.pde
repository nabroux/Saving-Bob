void newLetter(){
  for(int i=0;i<lCounter;i++){
      if(fuck[i]==null){
          fuck[i]=new Letter();
          return;
      }else{
        continue;
      }
    }    
    fuck[lCounter]=new Letter();
}

class Letter{
  int letX,letY;
  int name;
  PImage nabroux,nabroux1,nabroux2;
  
  Letter(){
    this.letX=30;
    this.letY=5;
    this.name=(int)random(0,4);
    if(name==3){
      nabroux = up;
      nabroux1 = upg;
      nabroux2 = upr;
      
    }else if(name==2){
      nabroux = left;
      nabroux1 = leftg;
      nabroux2 = leftr;
      
    }else if(name==1){
      nabroux = down;
      nabroux1 = downg;
      nabroux2 = downr;
      
    }else{
      nabroux = right;
      nabroux1 = rightg;
      nabroux2 = rightr;
      
    }
  }
  
  void moveDown(){
    if(stage2Timer.frame <=1200){
      this.letY+=speed*2;
    }else if(stage2Timer.frame <=2400){
      this.letY+=speed*1.5;
    }else if(stage2Timer.frame <=3600){
      this.letY+=speed;
    }
    
  }
  
  void displayLetter(){
    for(int i =0;i<lCounter;i++){
      if(fuck[i]!=null){
        image(fuck[i].nabroux,fuck[i].letX,fuck[i].letY);
      }
    }
  }
  
   
   

}

void keyDetect1(){
  
   for(int i =0;i<lCounter;i++){ 
    if(fuck[i]!=null){
      if(fuck[i].letY>height/2-100 && fuck[i].letY<height/2+80){
        
       if(key=='w'){
         if (fuck[i].name == 3){
           fuck[i].nabroux = fuck[i].nabroux1;
           haha[currentHairIndex].shrink();
           save.trigger();
         }else{
           fuck[i].nabroux = fuck[i].nabroux2;
           haha[currentHairIndex].grow();
           wrong.trigger();
         }
       }else if(key=='a'){
         if(fuck[i].name==2){
           fuck[i].nabroux = fuck[i].nabroux1;
           haha[currentHairIndex].shrink();
           save.trigger();
         }else{
           fuck[i].nabroux = fuck[i].nabroux2;
           haha[currentHairIndex].grow();
           wrong.trigger();
         }
       }else if(key=='s'){
         if(fuck[i].name==1){
           fuck[i].nabroux = fuck[i].nabroux1;
           haha[currentHairIndex].shrink();
           save.trigger();
         }else{
           fuck[i].nabroux = fuck[i].nabroux2;
           haha[currentHairIndex].grow();
           wrong.trigger();
         }
       }else if(key=='d'){
         if(fuck[i].name==0){
           fuck[i].nabroux = fuck[i].nabroux1;
           haha[currentHairIndex].shrink();
           save.trigger();
         }else{
           fuck[i].nabroux = fuck[i].nabroux2;
           haha[currentHairIndex].grow();
           wrong.trigger();
         }
       }
      }
     }
   }
 }