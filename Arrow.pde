void newArrow(){
  for(int i=0;i<aCounter;i++){
      if(shit[i]==null){
          shit[i]=new Arrow();
          return;
      }else{
        continue;
      }
    }    
    shit[aCounter]=new Arrow();
}

class Arrow{
  int aroX,aroY;
  int name;
  PImage nabroux,nabroux1,nabroux2;
  
  Arrow(){
    this.aroX=1112;
    this.aroY=5;
    this.name=(int)random(0,4);
    if(name==3){
      nabroux = up;
      nabroux1 = upg;
      nabroux2 = upr;
      
    }else if(name==2){
      nabroux = down;
      nabroux1 = downg;
      nabroux2 = downr;
      
    }else if(name==1){
      nabroux = left;
      nabroux1 = leftg;
      nabroux2 = leftr;
      
    }else{
      nabroux = right;
      nabroux1 = rightg;
      nabroux2 = rightr;
      
    }
  }
  
  void moveDown(){
    if(stage2Timer.frame <=1200){
      this.aroY+=speed*2;
    }else if(stage2Timer.frame <=2400){
      this.aroY+=speed*1.5;
    }else if(stage2Timer.frame <=3600){
      this.aroY+=speed;
    }
    
  }
  
  void displayArrow(){
    for(int i =0;i<aCounter;i++){
      if(shit[i]!=null){
        image(shit[i].nabroux,shit[i].aroX,shit[i].aroY);
      }
    }
  }
  
  
}

void keyDetect2(){
  
   for(int i =0;i<aCounter;i++){ 
    if(shit[i]!=null){
      if(shit[i].aroY>height/2-100 && shit[i].aroY<height/2+80){
        if(key==CODED){
       if(keyCode==UP){
         if (shit[i].name == 3){
           shit[i].nabroux = shit[i].nabroux1;
           haha[currentHairIndex].grow();
           save.trigger();
         }else{
           shit[i].nabroux = shit[i].nabroux2;
           haha[currentHairIndex].shrink();
           wrong.trigger();
         }
       }else if(keyCode==DOWN){
         if(shit[i].name==2){
           shit[i].nabroux = shit[i].nabroux1;
           haha[currentHairIndex].grow();
           save.trigger();
         }else{
           shit[i].nabroux = shit[i].nabroux2;
           haha[currentHairIndex].shrink();
           wrong.trigger();
         }
       }else if(keyCode==LEFT){
         if(shit[i].name==1){
           shit[i].nabroux = shit[i].nabroux1;
           haha[currentHairIndex].grow();
           save.trigger();
         }else{
           shit[i].nabroux = shit[i].nabroux2;
           haha[currentHairIndex].shrink();
           wrong.trigger();
         }
       }else if(keyCode==RIGHT){
         if(shit[i].name==0){
           shit[i].nabroux = shit[i].nabroux1;
           haha[currentHairIndex].grow();
           save.trigger();
         }else{
           shit[i].nabroux = shit[i].nabroux2;
           haha[currentHairIndex].shrink();
           wrong.trigger();
         }
       }
      }
     }
    }
   }
 }