class Enemy {
  float x, y;
  float w = LEG_SIZE;
  float h = LEG_SIZE;
  float size = 90;
  String playerAorB;

  void checkCollision(Player player){

    if(functions.isHit(x+5, y+5, w-5, h-5, player.x+30, player.y, player.w-60, player.h)){
      if(playerAorB == "A") 
      { 
        player.hurt(1); //bug!!Don't know how to represent A or B
         
    }
      else if(playerAorB == "B") 
      { 
        player.hurt(2);
        blow1.trigger(); 
      }
      this.x=-9000000;
      
      
    }
  }

  void display(){}
  void update()
    {
      if(x<=540) playerAorB = "A";
      else playerAorB = "B";
    }

  Enemy(float x, float y){
    this.x = x;
    this.y = y;
    if(x<=540) playerAorB = "A";
    else playerAorB = "B";
    
    
  }
}