class Supply{

  boolean notEatten;
  float x, y;
  float w = 90;
  float h = 90;
  String playerAorB;


  Supply(float x, float y){
    notEatten = true;  //wasn't eatten by player
    this.x = x;
    this.y = y;
    if(x<=540) playerAorB = "A";
    else playerAorB = "B";
}

	 // Display supply
     void display(){ //cause can't think of how to use string
      
        if(playerAorB == "A") image(goodMedSupply, x, y,80,110);
        else image(badMedSupply, x, y,80,110);
       
     }

	 // Check collision with player
     void checkCollision(Player player){
			if(functions.isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
				player.health ++;
				x = y = -1000; // don't show on screen
        supply.trigger();
       
      }
     
	}
}