ArrayList<GameObject> GameObjects;
GameObject Player;
void setup() {
  size(1000, 500,P3D);
  noStroke();
  smooth();
  GameObjects = new ArrayList<GameObject>();
  GameObjects.add(new Player(0, 0, width/20, height/20));
  GameObjects.add(new BadGuy(width/20, 0, width/20, height/20));
  GameObjects.add(new Wall(width-(width/10), 0, width/10, height/20));
  Player = GameObjects.get(0);
}
void draw() {
  Player.draw();
  GameObjects.get(1).draw();
  GameObjects.get(2).draw();
}
void LoadLevel() {
  XML Temp;
  Temp = loadXML("");
}
void mousePressed() {
}
void mouseReleased() {
}
void keyPressed() {
}
void keyReleased() {
}