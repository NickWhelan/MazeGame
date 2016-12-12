class GameObject {
  float x, y, w, h, ID;
  PImage Texture;
  boolean canDraw;
  String Tag;
  GameObject(float px, float py, float pw, float ph, String PType) {
    x = px;
    y = py;
    w = pw;
    h = ph;
    Tag = PType;
    rectMode(LEFT);
  }
  void LoadImage(String Path) {
    Texture = loadImage(Path);
    Texture.width = int(w);
    Texture.height = int(h);
  }
  void update() {
    if (x > width || x+w < 0) {
      canDraw = false;
    } else if (y > height || y+h < 0) {
      canDraw = false;
    }
    if (x+w > width) {
      x = width-w;
    } else if (x < 0) {
      x = 0;
    }
    if (y+h > height) {
      y = height-h;
    } else if (y < 0) {
      y = 0;
    }
  }  
  void draw() {
    update();
    fill(255);
  }
  void Input() {
  }
}

class Wall  extends GameObject {
  Wall(float px, float py, float pw, float ph, String PType) {
    super(px, py, pw, ph,PType);
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    fill(50);
    rect(0, 0, w, h);
    popMatrix();
  }
}


class Player  extends GameObject {
  Kinematics kinematics;
  float SpeedX,SpeedY;
  Player(float px, float py, float pw,float ph, String PType) {
    super(px, py, pw, ph,PType);
    SpeedX=0;
    SpeedY=0;
    kinematics = new Kinematics();
    kinematics.Position.x = x;
    kinematics.Position.y = y;
    kinematics.MaxVel = new Vector2(10, 10);
    //kinematics.Acceleration.x = 10;
    //kinematics.Acceleration.y = 10;
  }
  void update() {
    super.update();
    //kinematics.updatePosition();
    //x = kinematics.Position.x;
    //y = kinematics.Position.y;
    x+=SpeedX;
    y+=SpeedY;
  }
  void draw() {
    super.draw();
    pushMatrix();
    translate(x, y);
    fill(255, 0, 255);
    rect(0, 0, w, h);
    popMatrix();
  }
  void Input() {

    if ( keyCode == UP || keyCode == 'W') {
      //kinematics.Acceleration.y=-2f;
      SpeedY = -1.5f;
    } else if ( keyCode == DOWN || keyCode == 'S') {
      //kinematics.Acceleration.y=2f;
      SpeedY = 1.5f;
    }
    if ( keyCode == LEFT || keyCode == 'A') {
      //kinematics.Acceleration.x=-2f;
      SpeedX = -1.5f;
    } else if ( keyCode == RIGHT || keyCode == 'D') {
      //kinematics.Acceleration.x=2f;
      SpeedX = 1.5f;
    }
    if ( keyCode == ' ') {
      Pause = !Pause;
    }
  }
  void InputKeyUp() {
    if ( keyCode == UP || keyCode == 'W' || keyCode == DOWN || keyCode == 'S') {
      SpeedY=0;
    }
    
    if ( keyCode == LEFT || keyCode == 'A' || keyCode == RIGHT || keyCode == 'D') {
      SpeedX=0;
    }
  }
}

class BadGuy  extends GameObject {
  float SpeedX, SpeedY;
  BadGuy(float px, float py, float pw, float ph, String PType) {
    super(px, py, pw, ph,PType);
  }
  void update() {
    super.update();
    x+=SpeedX;
    y+=SpeedY;
  }
  void draw() {
    super.draw();
    pushMatrix();
    translate(x, y);
    fill(255, 0, 0);
    rect(0, 0, w, h);
    popMatrix();
  }
}