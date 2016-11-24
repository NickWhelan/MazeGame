class GameObject {
  float x, y, w, h;
  PImage Texture;
  boolean canDraw;
  GameObject(float px, float py, float pw, float ph) {
    x = px;
    y = py;
    w = pw;
    h = ph;
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
}

class Wall  extends GameObject {

  Wall(float px, float py, float pw, float ph) {
    super(px, py, pw, ph);
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
  Player(float px, float py, float pw, float ph) {
    super(px, py, pw, ph);
  }
  void update() {
  }
  void draw() {
    super.draw();
    pushMatrix();
    translate(x, y);
    fill(255,0,255);
    rect(0, 0, w, h);
    popMatrix();
  }
}

class BadGuy  extends GameObject {
  float SpeedX, SpeedY;
  BadGuy(float px, float py, float pw, float ph) {
    super(px, py, pw, ph);
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
     fill(255,0,0);
    rect(0, 0, w, h);
    popMatrix();
  }
}