$fn=400;
scale=25.4;
r=scale*(12.61+0.135*2)/2;
echo("Radius",r);

difference(){
circle(r=r);
translate([0,-200])square([400,400]);
}