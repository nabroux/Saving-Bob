PImage Q_Food,A_Food,W_Food,S_Food;

final int X_GAP = 35, Y_GAP = 40;
final int Q_F_X = Q_X+X_GAP;  
final int Q_F_Y = Q_Y+Y_GAP; 
final int A_F_X = A_X+X_GAP;  
final int A_F_Y = A_Y+Y_GAP; 
final int W_F_X = W_X+X_GAP;  
final int W_F_Y = W_Y+Y_GAP; 
final int S_F_X = S_X+X_GAP;  
final int S_F_Y = S_Y+Y_GAP; 

void initFoodImage(){          //initial Stage1 call this.
    answerFood = new PImage[11];
    otherFood = new PImage[35];
    //init answerFood
    for(int i=0;i<answerFood.length;i++){
    answerFood[i]=(loadImage("stage1img/food/answer/"+i+".png"));
    }
    //init otherFood
    for(int i=0;i<otherFood.length;i++){
    int index=i+1;
    otherFood[i]=(loadImage("stage1img/food/other ("+index+").png"));
    }
}

void displayFoodSet(){
    image(Q_Food,Q_F_X,Q_F_Y,Q_Food.width*0.8,Q_Food.height*0.8);
    image(A_Food,A_F_X,A_F_Y,A_Food.width*0.8,A_Food.height*0.8);
    image(W_Food,W_F_X,W_F_Y,W_Food.width*0.8,W_Food.height*0.8);
    image(S_Food,S_F_X,S_F_Y,S_Food.width*0.8,S_Food.height*0.8);
  }
 

class FoodSet{
  char foodSetAnswer; 
  int foodSetAnswerIndex;//0:Q 1:A 2:W 3:S
  int foodType; //0:cake 1:hamberger 2:hotdog 3:fries 4:chicken >4:normal
  
  FoodSet(){
  this.foodSetAnswerIndex = (int)random(0,4);
  this.foodType = (int)random(0,20); //add the chance of non-effect food
  if(foodType>answerFood.length-1){
    foodType = (int)random(5,11);
    }
  this.initFoodSet();
  }
  
  void initFoodSet(){
    if(foodSetAnswerIndex==0){
      foodSetAnswer='q';
      Q_Food = answerFood[foodType];
      A_Food = otherFood[(int)random(0,otherFood.length)];
      W_Food = otherFood[(int)random(0,otherFood.length)];
      S_Food = otherFood[(int)random(0,otherFood.length)];
    }else if(foodSetAnswerIndex==1){
      foodSetAnswer='a';
      Q_Food = otherFood[(int)random(0,otherFood.length)];
      A_Food = answerFood[foodType];
      W_Food = otherFood[(int)random(0,otherFood.length)];
      S_Food = otherFood[(int)random(0,otherFood.length)];
    }else if(foodSetAnswerIndex==2){
      foodSetAnswer='w';
      Q_Food = otherFood[(int)random(0,otherFood.length)];
      A_Food = otherFood[(int)random(0,otherFood.length)];
      W_Food = answerFood[foodType];
      S_Food = otherFood[(int)random(0,otherFood.length)];
    }else if(foodSetAnswerIndex==3){
      foodSetAnswer='s';
      Q_Food = otherFood[(int)random(0,otherFood.length)];
      A_Food = otherFood[(int)random(0,otherFood.length)];
      W_Food = otherFood[(int)random(0,otherFood.length)];
      S_Food = answerFood[foodType];
    } 
  }//function end
   
   
  void foodPower(){
    if(foodType==0){
      generateAcne(4,5);
      generateAcne(4,5);
    }else if(foodType==1){
      generateAcne(5,6);
    }else if(foodType==2){
      acneOp = true;
    }else if(foodType==3){
      generateAcne(1,2);
      generateAcne(1,2);
      generateAcne(1,2);
      generateAcne(1,2);
    }else if(foodType==4){
      //check acne array
      for(int i=0;i<acneCounter;i++){
        if(acneList[i]!=null && acneList[i].acneLevel<5){
        acneList[i].acneLevel+=1;
        }else{  
        }
      }
    }else{ //normal food
      generateAcne(1,4);
     
    }
  }
   
}
  