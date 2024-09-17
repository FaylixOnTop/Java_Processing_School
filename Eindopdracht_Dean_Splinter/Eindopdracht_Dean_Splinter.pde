//PlayerPOS\\
  int PlayerX = 275;
  int PlayerY = 290;

//Player Width/Height\\
  int PlayerWidth = 30;
  int PlayerHeight = 60;

//Ground Info\\
  int GroundHeight = 350;
  
//Rock Info\\
  int RockX = 400;
  int RockY = 290;
  int RockWidth = 55;
  int RockHeight = 35;
  int Rockspeed = 5;

void setup(){
  size(600, 400);
}


void draw(){
  
  //Background\\
  background(185, 230, 225);

  //Grond\\
  fill(240, 250, 125);
  rect(0, GroundHeight, 600, 100);
  
  noFill();
  
  //Speler\\
  fill(100, 125, 80);
  rect(PlayerX, PlayerY, PlayerWidth, PlayerHeight);

  
  //RockInfo\\
  noFill();
  fill(80, 80, 80);
  rect(RockX, RockY, RockWidth, RockHeight);
}
