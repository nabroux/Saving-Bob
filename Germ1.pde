//Germ1 is an obstacle on the path
class Germ1 extends Enemy{


  void display(){
    image(imgGerm1, x, y, LEG_SIZE, LEG_SIZE);
  }

  void update(){
    
  }

  Germ1(float x, float y){
    super(x, y);
  }
  
}