import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//among
PImage title, head, body, feet, goodHead, goodBody, goodFeet, badHead, badBody, badFeet, angle;
PImage startNormal,startHovered,countineHovered,countineNormal,nextHovered,nextNormal,returnHovered,returnNormal,intro,choose;
PImage color1, color2, color3, gary1, gary2, gary3;
PImage currentHead, currentBody, currentFeet;
PImage final_win,final_lose;
boolean stage1_isPlayed, stage2_isPlayed, stage3_isPlayed;


//stage1
PImage stage1_intro1,stage1_intro2,stage1_intro3,stage1_intro4,stage1_intro5;
PImage face, eye, mouthShut, mouthOpen,icon,icon2,iconShow,toolKey,toolKey2 ;
PImage acne5,acne4,acne3,acne2,acne1,acne0,acneScar;
PImage keyQ,keyA,keyW,keyS,win,lose;

//stage2
PImage stage2_intro1,stage2_intro2,stage2_intro3;
PImage bg,hair,line,sq,
w,wr,wg,a,ar,ag,s,sr,sg,dr,dg,d,
up,down,left,right,upr,downr,leftr,rightr,upg,downg,leftg,rightg;

//stage3
PImage stage3_intro1,stage3_intro2,stage3_intro3,gamelose,gamewin;
PImage bgA, bgB, skin, goodHealth, badHealth, goodStartLine, badStartLine, finishedLine;
PImage goodMedFull, badMedFull, superBadMedFull, superGoodMedFull;
PImage goodMedSupply, badMedSupply, cutin, imgGerm1, imgGerm2, imgGerm3, imgGerm4;
PFont font;
//among
final int GAME_START = 0, GAME_INTRO =1, GAME_CHOOSE =2;
final int STAGE_1_INTRO_1 = 3, STAGE_1_INTRO_2 = 4, STAGE_1_INTRO_3 = 5, STAGE_1_INTRO_4 = 6, STAGE_1_INTRO_5 = 7, STAGE_1_RUN = 8, STAGE_1_WIN = 9, STAGE_1_LOSE = 10; //for A
final int STAGE_2_INTRO_1 = 11, STAGE_2_INTRO_2 = 12, STAGE_2_INTRO_3 = 13, STAGE_2_RUN = 14, STAGE_2_WIN = 15, STAGE_2_LOSE = 16;
final int STAGE_3_INTRO_1 = 17, STAGE_3_INTRO_2 = 18, STAGE_3_INTRO_3 = 19, STAGE_3_RUN = 20, STAGE_3_LOSE = 21, STAGE_3_WIN = 22;
final int FINAL_WIN = 23 , FINAL_LOSE = 24;
int gameState = GAME_START; //testing!!!
int angelCredit = 0;

//stage1
boolean medMode,acneOp,answerIsMade;
Acne[] acneList;
PImage[] answerFood;
PImage[] otherFood;
FoodSet currentSet;
int acneCounter,acneFramecounter,acneOpCounter,devilCounter;

final int TOOL_X = 1160;
final int TOOL_Y = 720;
final int Q_X = 20;  
final int Q_Y = 70; 
final int A_X = 20;
final int A_Y = 550;
final int W_X = 1090;
final int W_Y = 70;
final int S_X = 1090;
final int S_Y = 550;

Timer stage1Timer;
//stage2
int speed = 5;
int catcc,wasdY;
int hairLife;
int frameCounter2,frameCounter2_2,lCounter,aCounter;
int frameFuck,frameShit;
Letter[] fuck = new Letter[6];
Arrow[] shit = new Arrow[6];
Hair[] haha = new Hair[6];
Boolean press = false;
Boolean press2 = false;

Timer2 stage2Timer;


//stage3
final int LEG_SIZE = 90;
final int translateNumber = -46400;  //7200 ->47200  -6400->-46400
final int START_BUTTON_WIDTH = 288;
final int START_BUTTON_HEIGHT = 120;

//stage3_Enemy
Enemy[] enemiesA;
Enemy[] enemiesB;
Supply[] suppliesA;
Supply[] suppliesB;
Cutin[] cutinA;
Cutin[] cutinB;
Stage3_initGame stage3_init = new Stage3_initGame();
Function functions = new Function();

//stage3_Timer
final int STAGE3_GAME_INIT_TIMER = 7200;
int stage3_gameTimer = STAGE3_GAME_INIT_TIMER;
//stage3_A_B
Player playerA = new Player(1);
Player playerB = new Player(2);
boolean Awin = false;
boolean Bwin = false;
boolean leftStateA = false;
boolean rightStateA = false;
boolean leftStateB = false;
boolean rightStateB = false;

void setup() {
  size(1260, 810, P2D);
  //among image
  title = loadImage("among_img/title.png");
  intro = loadImage("among_img/intro.png");
  final_win = loadImage("among_img/final_win.png");
  final_lose = loadImage("among_img/final_lose.png");
  startNormal = loadImage("among_img/startNormal.png");
  startHovered = loadImage("among_img/startHovered.png");
  returnNormal = loadImage("among_img/returnNormal.png");
  returnHovered = loadImage("among_img/returnHovered.png");
  nextNormal = loadImage("among_img/nextNormal.png");
  nextHovered = loadImage("among_img/nextHovered.png");
  countineNormal = loadImage("among_img/countineNormal.png");
  countineHovered = loadImage("among_img/countineHovered.png");
  choose = loadImage("among_img/choose.png");
  
  //choose_img
  head = loadImage("choose_img/Head.png");
  body = loadImage("choose_img/Body.png");
  feet = loadImage("choose_img/Feet.png");
  goodHead = loadImage("choose_img/goodHead.png");
  goodBody = loadImage("choose_img/goodBody.png");
  goodFeet = loadImage("choose_img/goodFeet.png");
  badHead = loadImage("choose_img/badHead.png");
  badBody = loadImage("choose_img/badBody.png");
  badFeet = loadImage("choose_img/badFeet.png");
  angle = loadImage("choose_img/angle.png");
  gary1 = loadImage("choose_img/gary1.png");
  gary2 = loadImage("choose_img/gary2.png");
  gary3 = loadImage("choose_img/gary3.png");
  color1 = loadImage("choose_img/color1.png");
  color2 = loadImage("choose_img/color2.png");
  color3 = loadImage("choose_img/color3.png");
  
  
  //stage_1 image
  stage1_intro1 = loadImage("stage1img/intro1.png");
  stage1_intro2 = loadImage("stage1img/intro2.png");
  stage1_intro3 = loadImage("stage1img/intro3.png");
  stage1_intro4 = loadImage("stage1img/intro4.png");
  stage1_intro5 = loadImage("stage1img/intro5.png");
  win = loadImage("stage2_img/win.png");
  lose = loadImage("stage2_img/lose.png");
  
  //stage_2 image
  stage2_intro1 = loadImage("stage2_img/intro1.png");
  stage2_intro2 = loadImage("stage2_img/intro2.png");
  stage2_intro3 = loadImage("stage2_img/intro3.png");
    bg = loadImage("stage2_img/main.png");
  hair = loadImage("stage2_img/hair.png");
  up = loadImage("stage2_img/up.png");
  down = loadImage("stage2_img/down.png");
  left = loadImage("stage2_img/left.png");
  right = loadImage("stage2_img/right.png");
  upg = loadImage("stage2_img/upg.png");
  downg = loadImage("stage2_img/downg.png");
  leftg = loadImage("stage2_img/leftg.png");
  rightg = loadImage("stage2_img/rightg.png");
  upr = loadImage("stage2_img/upr.png");
  downr = loadImage("stage2_img/downr.png");
  leftr = loadImage("stage2_img/leftr.png");
  rightr = loadImage("stage2_img/rightr.png");
  w = loadImage("stage2_img/w.png");
   wr = loadImage("stage2_img/wr.png");
  wg = loadImage("stage2_img/wg.png");
  ar = loadImage("stage2_img/ar.png");
  sr = loadImage("stage2_img/sr.png");
  dr = loadImage("stage2_img/dr.png");
  ag = loadImage("stage2_img/ag.png");
  sg = loadImage("stage2_img/sg.png");
  dg = loadImage("stage2_img/dg.png");
  a = loadImage("stage2_img/a.png");
  s = loadImage("stage2_img/s.png");
  d = loadImage("stage2_img/d.png");
  line = loadImage("stage2_img/line.png");
  sq = loadImage("stage2_img/sq.png");
  
  //stage_3 image
  bgA = loadImage("stage3_img/bgA.png");
  bgB = loadImage("stage3_img/bgB.png");
  skin = loadImage("stage3_img/skin.png");
  stage3_intro1 = loadImage("stage3_img/intro1.png");
  stage3_intro2 = loadImage("stage3_img/intro2.png");
  stage3_intro3 = loadImage("stage3_img/intro3.png");
  gamelose = loadImage("stage3_img/gamelose.png");
  gamewin = loadImage("stage3_img/gamewin.png");
  goodMedFull = loadImage("stage3_img/goodMedFull.png");
  badMedFull = loadImage("stage3_img/badMedFull.png");
  goodHealth = loadImage("stage3_img/goodHealth.png");
  badHealth = loadImage("stage3_img/badHealth.png");
  imgGerm1 = loadImage("stage3_img/germ1.png");
  imgGerm2 = loadImage("stage3_img/germ3.png");
  imgGerm3 = loadImage("stage3_img/germ2.png");
  imgGerm4 = loadImage("stage3_img/germ4.png");
  goodStartLine = loadImage("stage3_img/goodStartline.png");
  badStartLine = loadImage("stage3_img/badStartline.png");
  finishedLine = loadImage("stage3_img/finishedLine.png");
  goodMedSupply = loadImage("stage3_img/goodMedSupply.png");
  badMedSupply = loadImage("stage3_img/badMedSupply.png");
  cutin = loadImage("stage3_img/cutin.png");
  superBadMedFull = loadImage("stage3_img/superBadMedFull.png");
  superGoodMedFull = loadImage("stage3_img/superGoodMedFull.png");
  
  font = createFont("font/font.ttf", 56);
  textFont(font);
 //choose
  currentHead = head;
  currentBody = body; 
  currentFeet = feet;
 //stage1_Initialize Game
  initStage1();
  //stage2
   catcc = floor(random(3));
  frameFuck = (int)random(20,90);
  frameShit = (int)random(20,90);
  for(int i =0;i<6;i++){
    haha[i]=new Hair();
  }
  stage2Timer=new Timer2(3600);
  haha[0].hairLife=3;
  haha[1].hairLife=3;
  haha[2].hairLife=3;
 //stage3_Initialize Game
  stage3_gameTimer = STAGE3_GAME_INIT_TIMER; //can't put in initgame
  stage3_init.initGameA();
  stage3_init.initGameB();
  
 //BGM 
 init_stage_0_sound();
 initSE();
 
 //FRAMERATE CALL SHOULD BE PUT IN THE END OF SETUP()! OR THRER WILL BE A RUNTIME ERROR (5000ms...)
 frameRate(60);

}

//run distance

void draw(){
  
  switch (gameState) {
    //title WIDTH = 500 HEIGHT = 160
    //arrow WIDTH = 328 HEIGHT = 166
    // Start Screen
    case GAME_START: 
    functions.drawCover(title,547,585,250,80,GAME_INTRO,startNormal,startHovered);
    break;
    case GAME_INTRO: 
    functions.drawCover(intro,1010,640,229,116,GAME_CHOOSE,nextNormal,nextHovered);
    break;
    ///////////////////////important/////////////////////
    case GAME_CHOOSE:
    //all play
    if(stage1_isPlayed && stage2_isPlayed && stage3_isPlayed){
      if(angelCredit>=2){ //angel win
        game_over_angel();
        gameState=FINAL_WIN;
      }else{//devil win
        game_over_devil();
        gameState=FINAL_LOSE;
      }
    }else{
    functions.drawChoose(gary1,color1,0,300,STAGE_1_INTRO_1,stage1_isPlayed);
    functions.drawChoose(gary2,color2,300,195,STAGE_2_INTRO_1,stage2_isPlayed);
    functions.drawChoose(gary3,color3,495,320,STAGE_3_INTRO_1,stage3_isPlayed);
    image(choose,750,30);
    image(currentBody,0,0);
    image(currentHead,0,0);
    image(currentFeet,0,0);
    image(angle,0,0);
    }
    break;
    ///////////////////////important/////////////////////
    //stage1
    case STAGE_1_INTRO_1:
    functions.drawCover(stage1_intro1,1010,640,229,116,STAGE_1_INTRO_2,nextNormal,nextHovered);
    break;
    case STAGE_1_INTRO_2:
    functions.drawCover(stage1_intro2,1010,640,229,116,STAGE_1_INTRO_3,nextNormal,nextHovered);
    break;
    case STAGE_1_INTRO_3:
    functions.drawCover(stage1_intro3,1010,640,229,116,STAGE_1_INTRO_4,nextNormal,nextHovered);
    break;    
    case STAGE_1_INTRO_4:
    functions.drawCover(stage1_intro4,1010,640,229,116,STAGE_1_INTRO_5,nextNormal,nextHovered);
    break;    
    case STAGE_1_INTRO_5:
    functions.drawCover(stage1_intro5,1010,640,229,116,STAGE_1_RUN,nextNormal,nextHovered);
    break; 
    case STAGE_1_RUN:
    stage1_isPlayed = true;
    loadPixels();
    stage1Timer.frame --;
    
    //Background
    image(face, 0, 0, 1260, 810);
    
    //Eyes
    functions.drawEye(506, 360);
    functions.drawEye(814, 360);
    
    //Display Acnes
    for(int i=0;i<acneCounter;i++){
      if(acneList[i]!=null){
      acneList[i].displayAcne(acneList[i].acneLevel,acneList[i].acneX,acneList[i].acneY);    
      }
    }
    //generateAcnes
     acneFramecounter++;
     if(acneFramecounter == 600){
        if (stage1Timer.frame>=3000){
        generateAcne(1,3);
        }else if(stage1Timer.frame>=2400){
        generateAcne(1,4);
        }else if(stage1Timer.frame>=1800){
        generateAcne(1,5);
        }else if(stage1Timer.frame>1200){
        generateAcne(1,6);
        }else{
        generateAcne(1,6);
        }
      acneFramecounter=0;
    } 
    
     //Mouth
     imageMode(CENTER);
     image(mouthShut,width/2+40,height-207);
     imageMode(CORNER);
    
    //Keys 
     image(toolKey,TOOL_X,TOOL_Y);
     image(keyQ,Q_X,Q_Y);
     image(keyA,A_X,A_Y);
     image(keyW,W_X,W_Y);
     image(keyS,S_X,S_Y); 
    
    //AcneOp
     if(acneOp){
       acneOpCounter++;
       if(acneOpCounter==120){
       acneOpCounter=0;
       acneOp=false;
       }
      }     
     //Display Food
     displayFoodSet();     
     //DevilCounter
     devilCounter++;
     if(devilCounter == 180){
      nextFoodSet();
     }      
     //Draw Timer
     drawTimerUI(stage1Timer.frame);   
     //DevilTimer
     drawDevilTimer(Q_X+25,Q_Y+145);
     drawDevilTimer(A_X+25,A_Y+145);
     drawDevilTimer(W_X+25,W_Y+145);
     drawDevilTimer(S_X+25,S_Y+145);
     
     //Check Lose
      if(getNumOfAcne()>=29){
        gameState = STAGE_1_LOSE;
        stage_over_sound();
      }
      
      if(stage1Timer.frame<=0){ 
        stage1Timer.frame = 0;
        stage_over_sound();
        if(getNumOfAcne() > 10){
        gameState = STAGE_1_LOSE;
        }else{
        gameState = STAGE_1_WIN;
        }
      } 
      
    break; 
    case STAGE_1_WIN:
    angelCredit+=1;
    currentHead = goodHead;
    image(win,0,0,1260,810);
    functions.drawGameOver(547,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);
    medMode=false;
    break; 
    case STAGE_1_LOSE:
    currentHead = badHead;
    image(lose,0,0,1260,810);   
    functions.drawGameOver(547,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);
    medMode=false;
    break;  
    
    //stage2
    case STAGE_2_INTRO_1:
    functions.drawCover(stage2_intro1,1010,640,229,116,STAGE_2_INTRO_2,nextNormal,nextHovered);
    break; 
    case STAGE_2_INTRO_2:
    functions.drawCover(stage2_intro2,1010,640,229,116,STAGE_2_INTRO_3,nextNormal,nextHovered);
    break; 
    case STAGE_2_INTRO_3:
    functions.drawCover(stage2_intro3,1010,640,229,116,STAGE_2_RUN,nextNormal,nextHovered);
    break; 
    case STAGE_2_RUN:
    stage2_isPlayed = true;
     image(bg,0,0);   
     //counterL
  frameCounter2++;
  if(frameCounter2==frameFuck){
    if(lCounter<6){
    lCounter++;
    }
    newLetter();
    frameCounter2 = 0;
    frameFuck = (int)random(20,90);
  }
    //counterA
  frameCounter2_2++;
  if(frameCounter2_2==frameShit){
    if(aCounter<6){
    aCounter++;
    }
    newArrow();
    frameCounter2_2 = 0;
    frameShit = (int)random(20,90);
  }
//Letter  
  for(int i = 0;i<lCounter;i++){
    if(fuck[i]!=null){
      fuck[i].moveDown();
      fuck[i].displayLetter();
    }
  }
  
  for(int i =0;i<lCounter;i++){
    if(fuck[i]!=null){
      if(fuck[i].letY>=height/2-15){
        fuck[i] = null;
      }
    }
  }
  //Arrow
  for(int i = 0;i<aCounter;i++){
    if(shit[i]!=null){
      shit[i].moveDown();
      shit[i].displayArrow();
    }
  }
  for(int i =0;i<aCounter;i++){
    if(shit[i]!=null){
      if(shit[i].aroY>=height/2-15){
        shit[i] = null;
      }
    }
  }
  
  if(press){
    
    image(sq,1101,height/2-73,150,150);
  }
  if(press2){
    image(sq,11,height/2-73);
  };

  
  pushMatrix();

  for(int i=0;i<6;i++){
    translate(haha[i].hairX,haha[i].hairY);
    rotate(haha[i].angle);
    haha[i].displayHair();
    rotate(-haha[i].angle);
  
    translate(-haha[i].hairX,-haha[i].hairY);
  }  
  popMatrix();
  
  detectHair();
  
  //timer
  stage2Timer.frame --;
  drawTimerUI2(stage2Timer.frame);
  //win lose
  if(haha[0].hairLife<=0){
    gameState = STAGE_2_WIN;
    stage_over_sound();
  }
  if(haha[5].hairLife>=3){
    gameState = STAGE_2_LOSE;
    stage_over_sound();
  }  
  if(stage2Timer.frame<=0){
    stage_over_sound();
    if(haha[3].hairLife>0){
      gameState = STAGE_2_LOSE;
    }else{
      gameState = STAGE_2_WIN;
    }
  }
  break;

    case STAGE_2_WIN:
    currentBody = goodBody;
    image(win,0,0,1260,810);
    angelCredit+=1;
    functions.drawGameOver(547,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);
    break; 
    case STAGE_2_LOSE:
    currentBody = badBody;
    image(lose,0,0,1260,810);   
    functions.drawGameOver(547,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);
    break;
    
    //stage3
    case STAGE_3_INTRO_1:
    functions.drawCover(stage3_intro1,1010,640,229,116,STAGE_3_INTRO_2,nextNormal,nextHovered);
    break;
    case STAGE_3_INTRO_2:
    functions.drawCover(stage3_intro2,1010,640,229,116,STAGE_3_INTRO_3,nextNormal,nextHovered);
    break;
    case STAGE_3_INTRO_3:
    functions.drawCover(stage3_intro3,1010,640,229,116,STAGE_3_RUN,nextNormal,nextHovered);
    break;
    case STAGE_3_RUN: 
    stage3_isPlayed = true;
//playerA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  pushMatrix();  
  translate(0, max(translateNumber, playerA.PLAYER_INIT_Y-playerA.y));  //mouse

  //background
  for(int i=0;i<40;i++)
  {image(skin,0,1000*i,630,1000); }
  image(bgA,0,40000,630,7200);
  image(goodStartLine,0,300,630,90);
  image(finishedLine,0,46900,630,90); //-300
   
   //initial medicine
   playerA.display(1);
   playerA.update(1);
  
  //germA
   for(Enemy e : enemiesA){
      if(e == null) continue;
      e.update();
      e.display();
      e.checkCollision(playerA);
    }  
       
   //suppliesA
   for(Supply e : suppliesA){
      if(e == null) continue;
      e.display();
      e.checkCollision(playerA);
    }
    
   //cutinsA
   for(Cutin e : cutinA){
      if(e == null) continue;
      e.display();
      e.checkCollision(playerA);
    }
   popMatrix();

  //playerB!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   pushMatrix();
   translate(0, max(translateNumber, playerB.PLAYER_INIT_Y-playerB.y));  //mouse
  
   //background
   for(int i=0;i<40;i++)
   {image(skin,630,1000*i,630,1000); }
   image(bgB,630,40000,630,7200);
   image(badStartLine,630,300,630,90);
   image(finishedLine,630,46900,630,90); //-300
   
   //initial medicine
   playerB.display(2);
   playerB.update(2);
  
   //germB
   for(Enemy e : enemiesB){
      if(e == null) continue;
      e.update();
      e.display();
      e.checkCollision(playerB);
    }
    
   //suppliesB
   for(Supply e : suppliesB){
      if(e == null) continue;
      e.display();
      e.checkCollision(playerB);
    }
    
   //cutinsB
   for(Cutin e : cutinB){
      if(e == null) continue;
      e.display();
      e.checkCollision(playerB);

    }
    popMatrix(); 
    
   //central line
    stroke(0);
    strokeWeight(5);
    line(630,0,630,50000);   
    
   // Time UI
    strokeWeight(0);
    fill(0);
    rect(width/2-100, 0, 200, 67);
    textAlign(CENTER);
    String timeString = functions.convertFrameToTimeString(stage3_gameTimer);
    fill(0, 120);
    text(timeString, width/2+3, 55+3); //shadow
    fill(functions.getTimeTextColor(stage3_gameTimer));
    text(timeString, width/2, 55);
   
  //life
   if(playerA.health > playerA.PLAYER_MAX_HEALTH ){ playerA.health = playerA.PLAYER_MAX_HEALTH; }
   if(playerB.health > playerB.PLAYER_MAX_HEALTH ){ playerB.health = playerB.PLAYER_MAX_HEALTH; }
   for(int i=playerA.health-1; i>-1 ; i--){ 
      image(goodHealth,10+50*i,10,50,50);}
   for(int i=0; i<playerB.health ; i++){ 
      image(badHealth,1200-50*i,10,50,50);} 
      
   //run distance  
   functions.distance(playerA.y,0);
   functions.distance(playerB.y,1180);   
   
   //finish line dectection
   stage3_gameTimer --;
   if(stage3_gameTimer <= 0){
     stage3_gameTimer=0;
      if(playerA.y>playerB.y){ //A win B lose
           Awin = true;
           currentFeet = goodFeet;
           angelCredit+=1;
           playerA.superMode = true;
           playerB.superMode = true;
      }else{  //B win A lose
           Bwin = true;
           currentFeet = badFeet;
           playerA.superMode = true;
           playerB.superMode = true;
      }
    }
    
   if(Awin){
       image(gamewin,20,300,630,100);
       image(gamelose,680,300,630,100); 
       functions.drawGameOver(505,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);
       
   }
   if(Bwin){
       image(gamelose,10,300,630,100);
       image(gamewin,670,300,630,100);
       functions.drawGameOver(505,585,250,80,GAME_CHOOSE,returnNormal,returnHovered);   
   }       
   
   if(playerA.y > 46900 && playerA.y>playerB.y){Awin = true;}
   if(playerB.y > 46900 && playerB.y>playerA.y){Bwin = true;}
   if(playerA.y > 46900 && playerB.y > 46900 && playerA.y==playerB.y && playerA.health>playerB.health){Awin = true;}
   if(playerA.y > 46900 && playerB.y > 46900 && playerA.y==playerB.y && playerB.health>playerA.health){Bwin = true;} 
   break; 

case FINAL_WIN:
image(final_win ,0 ,0,1260, 810);
break;

case FINAL_LOSE:
image(final_lose ,0 ,0 ,1260, 810);
break;

  }
   
//mouse ICON
checkIcon();
image(iconShow,mouseX ,mouseY);



} 

void mousePressed() { 
  if(gameState==STAGE_1_RUN){
  //change tool  
  if(functions.isMouseHit(TOOL_X, TOOL_Y,80,80)&& acneOp != true) {
    click.trigger();
    toolKey=loadImage("stage1img/keyPressed.png");
     medMode=!medMode;
       if(medMode==true){
         toolKey2=loadImage("stage1img/fingerKey.png");
       }else{
         toolKey2=loadImage("stage1img/medKey.png");
       }
  }
     //clicked icon  
      iconShow = icon2;
     //beat Acne
      if(acneOp==false){
      beatAcne();
      }else{
      buzzer.trigger();
      }
      
  }else{
     iconShow = icon2;
  }
}

void mouseReleased() {
  if(gameState==STAGE_1_RUN){
    iconShow = icon;
    toolKey = toolKey2;
  }else{
    iconShow = icon;
  }
}


void keyPressed(){
  switch(gameState){
  case STAGE_1_RUN: 
if(answerIsMade!=true){  
 if(key=='q'){
   if(currentSet.foodSetAnswer == key){
     keyQ = loadImage("stage1img/Q_G.png");
     currentSet.foodPower();
     eat.trigger();
   }else{
     keyQ = loadImage("stage1img/Q_R.png");
     killOneAcne();
     devilCounter=0;
     hurt.trigger();
   }
 }else if(key=='a'){
   if(currentSet.foodSetAnswer == key){
     keyA = loadImage("stage1img/A_G.png");
     currentSet.foodPower();
     eat.trigger();
   }else{
     keyA = loadImage("stage1img/A_R.png");
     killOneAcne();
     devilCounter=0;
     hurt.trigger();
   }
 }else if(key=='w'){
   if(currentSet.foodSetAnswer == key){
     keyW = loadImage("stage1img/W_G.png");
     currentSet.foodPower();
     eat.trigger();
   }else{
     keyW = loadImage("stage1img/W_R.png");
     killOneAcne();
     devilCounter=0;
     hurt.trigger();
   }
 }else if(key=='s'){
   if(currentSet.foodSetAnswer == key){
     keyS = loadImage("stage1img/S_G.png");
     currentSet.foodPower();
     eat.trigger();
   }else{
     keyS = loadImage("stage1img/S_R.png");
     killOneAcne();
     devilCounter=0;
     hurt.trigger();
   }   
 }else if(key=='k'){
   for(int i=0;i<acneCounter;i++){
     acneList[i]=null;
     po.trigger();
  }
 }
}
  if(key=='q'||key=='a'||key=='w'||key=='s'){
    answerIsMade=true;
  }
 break;
  case STAGE_2_RUN:  
    switch (key) {
      case 'w':
        press2 = true;
        break;
      case 'a':
        press2 = true;
        break;
      case 's':
        press2 = true;
        break;
      case 'd':
        press2 = true;
        break;
    }
    if(key==CODED){
      switch (keyCode) {
        case UP:
          press = true;
          break;
        case DOWN:
          press = true;
          break;
        case RIGHT:
          press = true;
          break;
        case LEFT:
          press = true;
          break;
      }
    }
    keyDetect1();
    keyDetect2();

  break;   
  case STAGE_3_RUN:
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftStateB = true;
      break;
      case RIGHT:
      rightStateB = true;
      break;
    }
  }else if(key == 'a'){
    leftStateA = true;
  }else if(key == 'd'){
    rightStateA = true;} 
    break;
  }
}

void keyReleased(){
  switch(gameState){
  case STAGE_1_RUN: 
  
  break;
  case STAGE_2_RUN:  
  switch (key) {
      case 'w':
        press2 = false;
        break;
      case 'a':
        press2 = false;
        break;
      case 's':
        press2 = false;
        break;
      case 'd':
        press2 = false;
        break;
    }

    if(key==CODED){
      switch (keyCode){
        case UP:
          press = false;
          break;
        case DOWN:
          press = false;
          break;
        case RIGHT:
          press = false;
          break;
        case LEFT:
          press = false;
          break;
      }
    }
  
  
  break;   
  case STAGE_3_RUN:
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftStateB = false;
      break;
      case RIGHT:
      rightStateB = false;
      break;
    }
  }else if(key == 'a'){
    leftStateA = false;
  }else if(key == 'd'){
    rightStateA = false;} 
   break;

  }
}
