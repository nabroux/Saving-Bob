class Stage3_initGame{
  
  void initGameA(){  //put anything need to be inital when game start again
  
  // Initialize enemiesA and their position
  enemiesA = new Enemy[227];  //y=4400
      
  for(int i = 0; i < enemiesA.length; i++){
    float newX = random(0, 450);
    float newY = 900 + 50 * ( i*4 + floor(random(4)));
      if(i<40){
          int j = floor(random(0,7));
          if(j%7==6)enemiesA[i] = new Germ3(newX, newY);
          else if(j%7==5||j%7==4)enemiesA[i] = new Germ2(newX, newY);
          else enemiesA[i] = new Germ1(newX, newY);
      }else if(i<80){
          int j = floor(random(0,5));
          if(j%5==0 || j%5==1)enemiesA[i] = new Germ1(newX, newY);
          else if(j%5==2 || j%5==3) enemiesA[i] = new Germ2(newX, newY);
          else  enemiesA[i] = new Germ3(newX, newY);
      }else if(i<190){
          int j = floor(random(0,5));
          if(j%5==0)enemiesA[i] = new Germ1(newX, newY);
          else if(j%5==1 || j%5==2 || j%5==3) enemiesA[i] = new Germ2(newX, newY);
          else  enemiesA[i] = new Germ3(newX, newY);        
      }else{
          float newXX = random(105, 300);
          int j = floor(random(0,6));
          if(j%6==0)enemiesA[i] = new Germ1(newXX, newY);
          else if(j%6==1 || j%6==2) enemiesA[i] = new Germ2(newXX, newY);
          else  enemiesA[i] = new Germ3(newXX, newY);
      }
      
    }
  // Initialize suppliesA & cutinA and their position
  suppliesA = new Supply[35];
  cutinA = new Cutin[35];
  for(int i = 0; i < suppliesA.length; i++){
    float newX = random(0, 450);
    float newY = (1400*(i+1))+(floor(random(4))*100);
    int j = floor(random(0, 4));
    if(j%4==0||j%4==1||j%4==2){
    suppliesA[i] = new Supply(newX, newY); }
    else{
    cutinA[i] = new Cutin(newX, newY); }
    }
    checkGerm1(enemiesA,suppliesA,cutinA);
}
 void initGameB(){  //put anything need to be inital when game start again
  // Initialize enemiesB and their position
    enemiesB = new Enemy[227];
        
  for(int i = 0; i < enemiesB.length; i++){
    float newX = random(630, 1170);
    float newY = 900 + (180 * i) + floor(random(70));
      if(i<40){
          int j = floor(random(0,7));
          if(j%7==6)enemiesB[i] = new Germ3(newX, newY);
          else if(j%7==5||j%7==4)enemiesB[i] = new Germ2(newX, newY);
          else enemiesB[i] = new Germ1(newX, newY);
          
      }else if(i<80){
          int j = floor(random(0,5));
          if(j%5==0 || j%5==1)enemiesB[i] = new Germ1(newX, newY);
          else if(j%5==2 || j%5==3) enemiesB[i] = new Germ2(newX, newY);
          else  enemiesA[i] = new Germ3(newX, newY);
      }else if(i<190){
          int j = floor(random(0,5));
          if(j%5==0)enemiesA[i] = new Germ1(newX, newY);
          else if(j%5==1||j%5==2||j%5==3) enemiesB[i] = new Germ2(newX, newY);
          else  enemiesB[i] = new Germ3(newX, newY);
      }else{
          int j = floor(random(0,6));
          if(j%6==0)enemiesB[i] = new Germ1(newX, newY);
          else if(j%6==1||j%6==2) enemiesB[i] = new Germ2(newX, newY);
          else  enemiesB[i] = new Germ3(newX, newY);
      }      
 }
  // Initialize suppliesB & cutinB and their position
 suppliesB = new Supply[35];
  cutinB = new Cutin[35];
  for(int i = 0; i < suppliesB.length; i++){
    float newX = random(630, 1170);
    float newY = (1400*(i+1))+(floor(random(4))*100);
    int j = floor(random(0, 4));
    if(j%4==0||j%4==1||j%4==2){
    suppliesB[i] = new Supply(newX, newY); }
    else{
    cutinB[i] = new Cutin(newX, newY); }
    } 
    checkGerm1(enemiesB,suppliesB,cutinB);
 }
 
}