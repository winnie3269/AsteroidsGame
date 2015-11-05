SpaceShip silly=new SpaceShip();
Stars[] countStars= new Stars[50];//your variable declarations here
public void setup() 
{
  size(500, 500);
  background(0);
  noStroke();
  for (int i=0; i<countStars.length; i++)
  {
    countStars[i]= new Stars();
  }//your code here
}
public void draw() 
{
  background(0); 
  silly.move(); 
  silly.show(); 
  for (int i=0; i<countStars.length; i++)
  {
    countStars[i].show();
  }//your code here
}
public void keyPressed()
{
  if (keyCode==RIGHT)
  {
    silly.rotate(2);
  }
  if (keyCode==LEFT)
  {
    silly.rotate(2);
  }
  if (keyCode==UP)
  {
    silly.accelerate(0.15);
  }
  if (keyCode==DOWN)
  {
    silly.accelerate(-0.15);
  }
  if (key==' ')
  {
    silly.setX((int)(Math.random()*500)); 
    silly.setY((int)(Math.random()*500)); 
    silly.setPointDirection((int)(Math.random()*360));
  }
}
class SpaceShip extends Floater
{   
  public SpaceShip()
  {
    corners=3; 
    xCorners= new int[corners]; 
    yCorners= new int[corners]; 
    xCorners[0]=-8; 
    yCorners[0]=-8; 
    xCorners[1]=16; 
    yCorners[1]=0; 
    xCorners[2]=-8; 
    yCorners[2]=8; 
    myColor=color(150,0,50); 
    myCenterX=250; 
    myCenterY=250; 
    myDirectionX=0; 
    myDirectionY=0; 
    myPointDirection=180; //your code here
  }
  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY=y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX=x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY=y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
}
class Stars
{
  private int starX;
  private int starY;
  private int starColor;
  private int starSize;
  public Stars()
  {
    starX=(int)(Math.random()*500);
    starY=(int)(Math.random()*500);
    starSize=(int)(Math.random()*8);
    starColor=color(255, 255, 255, (int)(Math.random()*255));
  }
  public void show()
  {
    fill(starColor);
    noStroke();
    ellipse(starX, starY, starSize, starSize);
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners; //the number of corners, a triangular floater has 3   
  protected int[] xCorners; 
  protected int[] yCorners; 
  protected int myColor; 
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x); 
  abstract public int getX(); 
  abstract public void setY(int y); 
  abstract public int getY(); 
  abstract public void setDirectionX(double x); 
  abstract public double getDirectionX(); 
  abstract public void setDirectionY(double y); 
  abstract public double getDirectionY(); 
  abstract public void setPointDirection(int degrees); 
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180); 
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians)); 
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX; 
    myCenterY += myDirectionY; 

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 
    stroke(myColor); 
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180); 
    int xRotatedTranslated, yRotatedTranslated; 
    beginShape(); 
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX); 
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 