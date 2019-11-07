class Function{
  
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
return  ax + aw > bx && ax < bx + bw && ay + ah > by && ay < by + bh; }
  
  
boolean isMouseHit(float bx, float by, float bw, float bh){
  return  mouseX > bx && mouseX < bx + bw &&  mouseY > by && mouseY < by + bh; }
  
  
  void drawCover(PImage imageName,int BUTTON_X,int BUTTON_Y,int BUTTON_WIDTH,int BUTTON_HEIGHT,int nextStage,PImage buttonNameNormal,PImage buttonNameHovered){
    image(imageName, 0, 0);
    if(isMouseHit(BUTTON_X, BUTTON_Y, BUTTON_WIDTH, BUTTON_HEIGHT)) {
      image(buttonNameHovered, BUTTON_X, BUTTON_Y,BUTTON_WIDTH,BUTTON_HEIGHT);
      if(mousePressed){
        book.trigger();
        gameState = nextStage;
        if(nextStage==STAGE_1_RUN){
        stage_1_sound();
        }else if(nextStage==STAGE_2_RUN){
        stage_2_sound();
        }else if(nextStage==STAGE_3_RUN){
        stage_3_sound();
        }else if(nextStage==GAME_CHOOSE && imageName!=intro){
        stage_0_sound();
        }
        
      mousePressed = false; }
    }else{ image(buttonNameNormal, BUTTON_X, BUTTON_Y,BUTTON_WIDTH,BUTTON_HEIGHT); }
  }
  
  void drawGameOver(int BUTTON_X,int BUTTON_Y,int BUTTON_WIDTH,int BUTTON_HEIGHT,int nextStage,PImage buttonNameNormal,PImage buttonNameHovered){
    if(isMouseHit(BUTTON_X, BUTTON_Y, BUTTON_WIDTH, BUTTON_HEIGHT)) {
      image(buttonNameHovered, BUTTON_X, BUTTON_Y,BUTTON_WIDTH,BUTTON_HEIGHT);
      if(mousePressed){
        click.trigger();
        gameState = nextStage;
        if(nextStage==GAME_CHOOSE){
        stage_0_sound();
        }
        mousePressed = false; }
    }else{ image(buttonNameNormal, BUTTON_X, BUTTON_Y,BUTTON_WIDTH,BUTTON_HEIGHT); }
  }
  
    void drawChoose(PImage bgName,PImage bgHover,int mouseY,int CLICK_HEIGHT,int nextStage,boolean isPlayed){
      if(!isPlayed){
          image(bgName, 0, 0);
          if(isMouseHit(0, mouseY, 1260, CLICK_HEIGHT)) {
            image(bgHover,0, 0); //要有hover的圖案嗎？
            if(mousePressed){
              click.trigger();
              gameState = nextStage;
              mousePressed = false; }
            }else{ image(bgName, 0, 0); }
      }else{
       image(bgHover,0, 0);
      }
  }
  
  color getTimeTextColor(int frames){
  if(frames >= 7200){
    return #00ffff;
  }else if(frames >= 3600){
    return #ffffff;
  }else if(frames >= 1800){
    return #ffcc00;
  }else if(frames >= 600){
    return #ff6600;
  }
  return #ff0000;
}

String convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds/60), 2);
  result += ":";
  result += nf(floor(totalSeconds%60), 2);
  return result;
}
  
  
  //stage_1
  void drawEye(float x, float y){ 
  pushMatrix();
  translate(x, y);
  rotate(radianTowardsMouse(x,y));
  imageMode(CENTER);
  image(eye, 0, 0, 77.7, 77.7);  
  imageMode(CORNER);
  popMatrix();
}
  
  
  
  //stage_3
  void distance(float value, int aOrB){
  strokeWeight(3);
  int whereIsX = 40;
  int whereIsY = 560;
  int LongOfRoad = 180;
  int widthOfRoad = 20;
  //long rect represent road
  fill(#FFFFFF); //white
  rect(whereIsX+aOrB-(widthOfRoad/2), whereIsY, widthOfRoad, LongOfRoad);
  float afterValue = map(value,200,47200,0,LongOfRoad);
  if(afterValue>LongOfRoad){ afterValue=LongOfRoad; }
  //short rect represent player's position
  //line(whereIsX+aOrB-10, whereIsY+afterValue, whereIsX+aOrB+10, whereIsY+afterValue);
  fill(#A00500);  //red
  rect(whereIsX+aOrB-(widthOfRoad/2), whereIsY+afterValue, widthOfRoad, 5);
  }

}//class2的右括號
void checkGerm1(Enemy[] enemies,Supply[] supplies,Cutin[] cutins){
  //check supplies 
    for(int i=0;i<supplies.length;i++){
      if(supplies[i]!=null){
        for(int j=0;j<enemies.length;j++){
        if(enemies[j]!=null){  
        while(functions.isHit(enemies[j].x+5, enemies[j].y+5, enemies[j].w-5, enemies[j].h-5, supplies[i].x+30, supplies[i].y, supplies[i].w-60, supplies[i].h))
         {
            if(supplies==suppliesA){
            supplies[i].x = random(0, 450);
            }else{
            supplies[i].x = random(630, 1170);
            }
         }
        } 
       }
      }  
    }
  //check cutins
    for(int i=0;i<cutins.length;i++){
      if(cutins[i]!=null){
        for(int j=0;j<enemies.length;j++){
        if(enemies[j]!=null){ 
        while(functions.isHit(enemies[j].x+5, enemies[j].y+5, enemies[j].w-5, enemies[j].h-5,cutins[i].x+30, cutins[i].y, cutins[i].w-60,cutins[i].h))
         {
            if(cutins==cutinA){
            cutins[i].x = random(0, 450);
            }else{
            cutins[i].x = random(630, 1170);
            }
         }
        }  
      }  
    }
    }
  
}