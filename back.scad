$fn=400;
scale=25.4;
r=scale*(12.61+0.135*2)/2;
echo("Radius",r);
echo("Diameter",r*2);

difference(){
circle(r=r);
circle(r=40);
}