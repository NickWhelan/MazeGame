static enum State {
  PLAY, 
    PAUSE, 
    MENU
};
static float DeltaTime;
boolean Print;
State GameState = State.PLAY;
ArrayList<GameObject> GameObjects;
Player Player;
boolean Pause;

//added for mazeGame
int NumberOfPlayers, NumberOfEnemys;

void setup() {
  Print = false;
  size(1000, 500);
  noStroke();
  smooth();
  frameRate(60);
  textAlign(LEFT, TOP);
  Pause = false;
  DeltaTime = 1/frameRate;
  GameObjects = new ArrayList<GameObject>();
  GameObjects.add(new Player(0, 0, width/20, height/20, "Player"));
  GameObjects.add(new BadGuy(width/20, 0, width/20, height/20, "BadGuy"));
  GameObjects.add(new Wall(width-(width/10), 0, width/10, height/20, "Wall"));
  Player = (Player)GameObjects.get(0);
  NumberOfPlayers++;
  NumberOfEnemys++;
}
void update() {
  DeltaTime = 1/frameRate;
}
void draw() {
  background(150);
  if (!Pause) {
    Player.draw();
  }
  GameObjects.get(1).draw();
  GameObjects.get(2).draw();
  if (Pause) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 0);
  }
  textAlign(LEFT, TOP);
  text(int(frameRate), 0, 0);
  text("Player.x:"+Player.x+" Player.y: "+Player.y, 0, 10);
  text("Player acceleration X:"+Player.kinematics.Acceleration.x+" Player acceleration y: "+Player.kinematics.Acceleration.y, 0, 20);
  textAlign(CENTER, BOTTOM);
  if (mouseX >0 && mouseY >0) {
    //text("MouseX:"+(float)(width/mouseX) +" MouseY:"+ (float)(height/mouseY), mouseX, mouseY);
    text("MouseX:"+(float)(mouseX) +" MouseY:"+ (float)(mouseY), mouseX, mouseY);
  }
}
void LoadLevel() {
  XML Temp;
  Temp = loadXML("");
}

void BoxBox() {
  int offset = NumberOfPlayers;
  offset +=NumberOfEnemys;
  for (int i=offset; i <GameObjects.size(); i++) {
    if (Player.x < GameObjects.get(i).x +GameObjects.get(i).w && Player.x+Player.w > GameObjects.get(i).x +GameObjects.get(i).w ) {
      Player.x = Player.x+Player.w;
    } else if (Player.x+Player.w > GameObjects.get(i).x && Player.x < GameObjects.get(i).x ) {
    }
  }
}

void mousePressed() {
  switch(GameState) {
  case PLAY:
  float x = mouseX;
  float y = mouseY;
  float WIDTH = width;
  float HEIGHT= height;
  print("MouseX:"+WIDTH/x +"\nMouseY:"+ HEIGHT/y+"\n\n");
    break;
  case PAUSE:
    break;
  case MENU:
    break;
  }
}
void mouseReleased() {
  switch(GameState) {
  case PLAY:
    break;
  case PAUSE:
    break;
  case MENU:
    break;
  }
}
void keyPressed() {
  switch(GameState) {
  case PLAY:
    Player.Input();
    break;
  case PAUSE:
    break;
  case MENU:
    break;
  }
}
void keyReleased() {
  switch(GameState) {
  case PLAY:
    Player.InputKeyUp();
    break;
  case PAUSE:
    break;
  case MENU:
    break;
  }
}