Minim minim = new Minim(this);
Minim minim2 = new Minim(this);
AudioPlayer bgSong,gameSong;
AudioSample click,eat,po,wrong,hurt,supply,rush,heal,buzzer,book,blow1,save;

void initSE(){
click = minim2.loadSample("se/click.mp3");
eat = minim2.loadSample("se/eat.mp3");
po = minim2.loadSample("se/stage1_po.mp3");
wrong= minim2.loadSample("se/stage2_wrong.mp3");
hurt = minim2.loadSample("se/stage3_hurt.mp3");
supply = minim2.loadSample("se/stage3_life.mp3");
rush = minim2.loadSample("se/stage3_rush.mp3");
heal = minim2.loadSample("se/heal.mp3");
buzzer = minim2.loadSample("se/Buzzer.mp3");
book = minim2.loadSample("se/Book.mp3");
blow1 = minim2.loadSample("se/Blow1.mp3");
save = minim2.loadSample("se/Save.mp3");
}

void init_stage_0_sound(){
  gameSong = minim.loadFile("bgm/bgSong.mp3");
  gameSong.play();
  gameSong.loop();
}

void stage_0_sound(){
  bgSong.pause();
  gameSong.play();
  gameSong.loop();
}

void stage_1_sound(){
  gameSong.pause();
  bgSong = minim.loadFile("bgm/stage1.mp3");
  bgSong.play();
  bgSong.loop();
}

void stage_2_sound(){
  gameSong.pause();
  bgSong = minim.loadFile("bgm/stage2.mp3");
  bgSong.play();
  bgSong.loop();
}

void stage_3_sound(){
  gameSong.pause();
  bgSong = minim.loadFile("bgm/stage3.mp3");
  bgSong.play();
  bgSong.loop();
}

void stage_over_sound(){
  bgSong.pause();
  bgSong = minim.loadFile("bgm/stage_over.mp3");
  bgSong.play();
 
}

void game_over_devil(){
  bgSong.pause();
  gameSong.pause();
  bgSong = minim.loadFile("bgm/final_fail.mp3");
  bgSong.play();
 
}

void game_over_angel(){
  bgSong.pause();
  gameSong.pause();
  bgSong = minim.loadFile("bgm/final_success.mp3");
  bgSong.play();
 
}