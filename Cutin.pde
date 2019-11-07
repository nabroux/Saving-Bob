class Cutin{
  float x, y;
  float w = LEG_SIZE;
  float h = LEG_SIZE;
  final float DOWN_SPEED = 2;
  float timer =0;
  float superTimer =0;

  
  Cutin(float x, float y)
  {
    this.x = x;
    this.y = y;
      
  }
  
  void display(){   
    image(cutin, x, y,90,90);
  }
  
   
  void checkCollision(Player player){
    if(timer != 0){
       //if(player.x<540) image(superGoodMedFull,player.x,player.y,110,110);
       //else if(player.x>630) image(superBadMedFull,player.x,player.y,110,110);  
       player.y += DOWN_SPEED*2;        
       timer--;  
       superTimer++;   
       player.superMode = true;
    }
    if(superTimer == 300){
       player.superMode = false; 
    }
    
    if(functions.isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
          
          x = y = -1000; // don't show on screen
          timer = 300;
          superTimer = 0;
          rush.trigger();
          player.superMode = true;
        }   
  }

}