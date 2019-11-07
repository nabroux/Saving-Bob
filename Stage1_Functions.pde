int width_devilCounter = 105;
int height_devilCounter = 3;

void initStage1(){
  initFoodImage();
  stage1Timer = new Timer(3600);
  noCursor();
  medMode=false;
  answerIsMade=false;

  face = loadImage("stage1img/face.png");
  eye = loadImage("stage1img/eye.png");
  acneScar = loadImage("stage1img/acneScar.png");
  acne0 = loadImage("stage1img/acne0.png");
  acne1 = loadImage("stage1img/acne1.png");
  acne2 = loadImage("stage1img/acne1.png");
  acne3 = loadImage("stage1img/acne1.png");
  acne4 = loadImage("stage1img/acne1.png");
  acne5 = loadImage("stage1img/acne4.png");
  mouthShut = loadImage("stage1img/mouthShut.png");
  icon = loadImage("stage1img/finger.png");
  icon2 = loadImage("stage1img/finger2.png");
  iconShow = icon;
  toolKey = loadImage("stage1img/medKey.png");
  toolKey2 = loadImage("stage1img/medKey.png");
  keyQ = loadImage("stage1img/Q.png");
  keyA = loadImage("stage1img/A.png");
  keyW = loadImage("stage1img/W.png");
  keyS = loadImage("stage1img/S.png");
  
  font = createFont("font/font.ttf", 56);
  textFont(font);
  
  acneCounter = 0;
  acneList = new Acne[50];
  currentSet = new FoodSet();
  
}

//check icon
void checkIcon(){
  if(acneOp){
     icon = loadImage("stage1img/crossIcon.png");
     icon2 = loadImage("stage1img/crossIcon2.png");
  }else if(medMode==true){
     icon = loadImage("stage1img/med.png");
     icon2 = loadImage("stage1img/med2.png");      
  }else{
     icon = loadImage("stage1img/finger.png");
     icon2 = loadImage("stage1img/finger2.png");      
  } 
  if(mousePressed!=true){
     iconShow=icon;
  }
}

void nextFoodSet(){
  keyQ = loadImage("stage1img/Q.png");
  keyA = loadImage("stage1img/A.png");
  keyW = loadImage("stage1img/W.png");
  keyS = loadImage("stage1img/S.png");
  currentSet = new FoodSet();
  devilCounter=0;
  answerIsMade=false;
}

void drawDevilTimer(int x,int y){
float devilTime = map(devilCounter,0,180,0,width_devilCounter);
noStroke();
fill(255);
rect(x,y,width_devilCounter,height_devilCounter);
fill(-125006);
rect(x,y,devilTime,height_devilCounter);

}

//Draw eyes functions
float  radianTowardsMouse(float x,float y){
  float eyeRad = atan2(mouseY-y, mouseX-x);
  return eyeRad;

}


int getNumOfAcne(){
  int numOfAcne = 0;
  for(int i=0;i<acneCounter;i++){
    if(acneList[i]!=null){
    numOfAcne++;
    }
  }
  return numOfAcne;
}