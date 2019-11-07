//Germ2 is an enemy walking back and through.
class Germ2 extends Enemy{
  float speed = 3f;  //2f


  void display(){
  
    if(speed>=0){
      pushMatrix();
      scale(1,1);
      image(imgGerm2, x, y, LEG_SIZE, LEG_SIZE);
      popMatrix();
    }else{
      pushMatrix();
      translate(80,0);
      scale(-1,1); 
      image(imgGerm2,-x,y, LEG_SIZE, LEG_SIZE);
      popMatrix();
    }
  }

  void update(){
    float currentSpeed = speed;
    x += currentSpeed;    
   
    if(playerAorB=="A"){
      if(y>43400){
         if(x < 100 || x > 340){speed *= -1 ;}
      }else{
         if(x < 0 || x > 540){speed *= -1 ;}
      }
    }
    
    if(playerAorB=="B"){
      if(y>43400){
         if(x < 830 || x > 970){speed *= -1 ;}
      }else{
         if(x < 630 || x > 1170){speed *= -1 ;}
      }
      
      
      
    }
   
  }

  Germ2(float x, float y){
    super(x, y);
    
  }
  
}