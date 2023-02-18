private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;
public void setup()
{
  size(800, 800);
  noLoop();
}
public void draw()
{
  background(41, 71, 255);
  jellyfish(400, 400, 100, 3*Math.PI/2, 10);
}
public void jellyfish(int x, int y, double branchLength, double angle, int w)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(w);
  stroke(240, 237, 152, 50);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(x, y, endX1, y+endY1);
  line(x, y, endX2, y+endY2);
  if (branchLength > smallestBranch)
  {
    jellyfish(endX1, endY1, branchLength, angle1, w-1);
    jellyfish(endX2, endY2, branchLength, angle2, w-1);
  }
}
