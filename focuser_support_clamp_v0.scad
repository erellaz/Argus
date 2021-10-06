//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=400;
scale=25.4;


rhs=.1360*scale/2; //drill at .1360 to tap for 8-32 screws
hm=120; //heigth  mm
w=14;


//linear_extrude(3){
difference(){
square([hm,w],center=true);
translate([hm/2.6,0])  circle(r=rhs);
translate([0,0])       circle(r=rhs);
translate([-hm/2.6,0]) circle(r=rhs);
}
//}