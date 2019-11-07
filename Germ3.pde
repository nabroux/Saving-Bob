//Germ3 will speed up when detected player
class Germ3 extends Enemy{
float speed = 4f; //3f

  void display(){
     image(imgGerm3, x, y, LEG_SIZE, LEG_SIZE);
     
  }

  void update(){
    
    if(playerAorB=="A")
      if(playerA.y+270 >= this.y && playerA.y-270 <= this.y+90) 
      {
        if(playerA.x >= this.x) x+=speed;
        if(playerA.x <= this.x) x-=speed;     
      }
    
    if(playerAorB=="B")
      if(playerB.y+270 >= this.y && playerB.y-270 <= this.y+90) 
      {
        if(playerB.x >= this.x) x+=speed;
        if(playerB.x <= this.x) x-=speed;     
      }
  }

  Germ3(float x, float y){
    super(x, y);
  }
  
}