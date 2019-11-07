final int GAME_INIT_TIMER2 = 3600;

void drawTimerUI2(int gameTimer){

  String timeString = convertFramesToTimeString2(gameTimer); // Requirement #4: Get the mm:ss string using String convertFramesToTimeString(int frames)

  textAlign(CENTER);

  // Time Text Shadow Effect - You don't have to change this!
  fill(0, 120);
  text(timeString, width/2, 775);

  // Actual Time Text
  color timeTextColor = getTimeTextColor2(gameTimer);     // Requirement #5: Get the correct color using color getTimeTextColor(int frames)
  fill(timeTextColor);
  text(timeString, width/2, 790);
}

//some methods
String convertFramesToTimeString2(int frames){  // Requirement #4
  int mm = (int)(frames / 3600);
  int ss = (int)((frames % 3600)/60);    
  return "0"+mm+":"+nf(ss,2);
}

color getTimeTextColor2(int frames){        // Requirement #5
  if(frames>=2400){
  return #ffffff;
  }else if(frames>=1200){
  return #ffcc00;
  }else if(frames>600){
  return #ff6600;
  }else{
  return #ff0000;
  }  
}

//constructor
class Timer2{
  int frame;
  
  Timer2(int frame){
    this.frame=frame;
  }

}