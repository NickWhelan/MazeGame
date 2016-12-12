 //<>//
class Vector2 {
  float x, y;
  Vector2 () {
    x =0;
    y= 0;
  }
  Vector2 (float px, float py) {
    x =px;
    y= py;
  }
  String VecToString() {
    return "x:"+x+",y:"+y;
  }

  Vector2 Math (char Operator, Vector2 B) {
   if(Print) print(this.VecToString()+Operator + B.VecToString()+'=');
    try {
      switch(Operator) {
      case '+':
       if(Print) println(new Vector2(this.x+B.x, this.y+B.y).VecToString());
        return new Vector2(this.x+B.x, this.y+B.y);
      case '-':
       if(Print) println(new Vector2(this.x-B.x, this.y-B.y).VecToString());
        return new Vector2(this.x-B.x, this.y-B.y);
      default:
        if(Print) print(Operator + " is not yet supported ");
        throw new StringException("Vector Math Error\n");
      }
    }
    catch(StringException e) {
      print(e);
      return null;
    }
  }

  Vector2 Math (char Operator, float B) {
    if(Print) print(this.VecToString()+ Operator + B + '=');
    try {
      switch(Operator) {
      case '+':
       if(Print) println(new Vector2(this.x+B, this.y+B).VecToString());
        return new Vector2(this.x+B, this.y+B);
      case '-':
        if(Print) println(new Vector2(this.x-B, this.y-B).VecToString());
        return new Vector2(this.x-B, this.y-B);
      case '/':
        if (B==0) {
          throw new StringException("Dvide by zero\n");
        }
        if(Print) println(new Vector2(this.x/B, this.y/B).VecToString());
        return new Vector2(this.x/B, this.y/B);
      case '*':
        if(Print) println(new Vector2(this.x*B, this.y*B).VecToString());
        return new Vector2(this.x*B, this.y*B);
      default:
        if(Print) print(Operator + " is not yet supported ");
        throw new StringException("Vector Math Error\n");
      }
    }
    catch(StringException e) {
      println(e);
      return null;
    }
  }

  float Magnitude() {
    return sqrt(pow(this.x, 2)+pow(this.y, 2));
  }
  Vector2 Normalized() {
    return Math('/', Magnitude());
  }
}

class Kinematics {
  Vector2 Position, Acceleration, Velocity, MaxVel;
  Kinematics() {
    MaxVel = Position = Acceleration = Velocity= new  Vector2();
  }
  void updatePosition() {
     if(Print) println("\nPosition " + Position.VecToString());
     if(Print) println("Acceleration " + Acceleration.VecToString());
     if(Print) println("Velocity " + Velocity.VecToString()+"\n");
    
    Velocity = Velocity().Math('+', Velocity);
    if (Velocity.x > MaxVel.x) {
      Velocity.x = MaxVel.x;
    }
    if ( Velocity.y > MaxVel.y) {
      Velocity.y = MaxVel.y;
    }
    Position = Position.Math('+', Displacement());
     if(Print) println(Position.VecToString());
    //noLoop();
  }
  Vector2 Acceleration() {
    //A = V/T;
    if(Print) print("Acceleration ");
    return Velocity.Math('/', DeltaTime);
  }
  Vector2 Velocity() {
    //Vf = Vi + at
    if(Print) print("Velocity ");
    return Velocity.Math('*', 2).Math('+', Acceleration.Math('*', DeltaTime));
  }
  Vector2 VelocitySquared() {
    //Vf^2 = Vi*2 + 2(a*d)
    return Velocity.Math('*', 2).Math('+', Acceleration().Math('*', Position).Math('*', 2));
  }
  Vector2 Displacement() {
    if(Print) print("Displacement ");
    return Velocity.Math('*', DeltaTime).Math('+', Acceleration().Math('*', pow(DeltaTime, 2)));
  }
  /*
     A = V/T;
   Vf = Vi + at     
   D = Vi*t + 1/2(a*t^2) 
   Vf^2 = Vi*2 + 2(a*d) 
   D = 1/2 ( Vf + Vi )t
   
   Vi is the initial velocity
   Vf is the final velocity
   a is the acceleration
   d is the displacement
   t is the time
   */
}

class StringException extends Exception {

  public StringException(String message) {
    super(message);
  }
}