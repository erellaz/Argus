scale=25.4;    // Inch to mm

//body
hm=8; //heigth  mm
spacer_width=40; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
spacer_thickness=40;
spacer_width_b=50;
shift=1.5;
tol=.5;

//rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws
rlh=0.165*scale/2; // for 8-32 no tapping

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=400;

difference(){
union(){
translate([0,(spacer_thickness/2)-7.5,0])cube(size = [spacer_width_b,spacer_thickness, hm], center = true);
difference(){
translate([0,-5,-10])cube(size = [spacer_width_b,20, 28], center = true);    
translate([0,0,-15])cube(size = [spacer_width+tol,15+tol, 30], center = true);     
}
}
//The holes
translate([spacer_width/3,-shift/2,-hm/2]) cylinder(h=30, r=rlh+tol, center=true);
translate([-spacer_width/3,-shift/2,-hm/2]) cylinder(h=30, r=rlh+tol, center=true);
translate([0,-3.5-4,-24]) rotate([90,0,0]) cylinder(h=8, r=6.5, center=true);
}


if(0){
color("red"){
   hm=80; //heigth  mm
    spacer_width=40; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
    spacer_thickness=15;
   translate([0,0,-hm/2])cube(size = [spacer_width-1,spacer_thickness-1, hm-1], center = true); 
}
}

if(0){
color("green"){
   translate([0,-3.5-4,-24]) rotate([90,0,0]) cylinder(h=8, r=6.5, center=true);
}
}