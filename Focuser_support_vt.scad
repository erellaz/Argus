// Base for Spider by 
// 12/14/2020
// Visit erellaz.com for additional documentation and workflow

scale=25.4;    // Inch to mm

//Body
hm=120; //heigth  mm
spacer_width=140; // width in mm
spacer_thickness=18+12; // thickness in mm

//The telescope tube
tubeor=12.88*scale/2;//tube outside radius

// Controls how dip the telecope tube cuts in
shift=17; // to shift the part inside the tube, to control extrusion

//Contol how the corners are cut
shift_corner=-32;
theta=19; // angle for the machine corner. The tube axis is the angle axis.

//Controls screw holes
rhs=0.165*scale/2; // for 8-32 no tapping
rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws

//Central hole for focuser
df=2.75*scale;

//Holes for focuser base
ho=scale*2.75/2;

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
//$fn=400;



module machine_corners(theta){
     rotate([0,0,theta])translate([0,(shift_corner-tubeor),0])union(){
     cube(size = [spacer_width+20,spacer_thickness, hm+20], center = true);
     translate([0,0,hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
     translate([0,0,0]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
     translate([0,0,-hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
     }
}

module focuser_plate_holes(){
    translate([ho,(shift_corner-tubeor),ho]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rlh, center=true);
    translate([ho,(shift_corner-tubeor),-ho]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rlh, center=true);
    translate([-ho,(shift_corner-tubeor),ho]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rlh, center=true);
    translate([-ho,(shift_corner-tubeor),-ho]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rlh, center=true);
    
}
//_________________________________________________________________________________
//main body
difference(){
difference(){
translate([0,(-tubeor+.1+shift-spacer_thickness/2),0])cube(size = [spacer_width,spacer_thickness, hm], center = true);
cylinder(h=hm*2, r=tubeor, center=true);
translate([0,(shift-tubeor-(3*spacer_thickness/2)),0])rotate([90,0,0])cylinder(h=hm*2, r=df/2, center=true);
}

union(){
  machine_corners(theta);
  machine_corners(-theta);
  focuser_plate_holes();
}

}
//_________________________________________________________________________________

//testing the cylinder
if(0){
  color( "red" ) {
     rotate([0,0,theta])translate([0,(shift_corner-tubeor),0])union(){
     cube(size = [spacer_width+20,spacer_thickness, hm+20], center = true);
     translate([0,0,hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
     translate([0,0,0]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
     translate([0,0,-hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_thickness*3, r=rhs, center=true);
         }
      }
  }