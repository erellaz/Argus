// Base for Spider by 
// 12/14/2020
// Visit erellaz.com for additional documentation and workflow

scale=25.4;    // Inch to mm

//body
hm=80; //heigth  mm
hm2=50;
spacer_width=50; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
spacer_thickness=13;
spacer_length=15;//the length of the spacer inside the telescope, used to separate the 1/4 holes only

tubeor=12.88*scale/2;

shift=2;
nbrholestele=2;

theta=6.1;

rhh=.25*scale/2;//for 1/4-20 no tapping
rhs=0.165*scale/2; // for 8-32 no tapping

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files

//$fn=400;
// the 1/4 holes through the tube
module drill_holes_tele(hm,nbrholestele,spacer_length,rhh){
   spacing=hm/(nbrholestele*3);
    for(j = [0 : 1 : nbrholestele-1]){
     translate([0,0,(nbrholestele-1-2*j)*spacing]) rotate([90,0,0]) cylinder(h=spacer_length*2, r=rhh, center=true);
    }
}

module machine_corners(theta){
    rotate([0,0,theta])translate([0,(shift-tubeor-(3*spacer_thickness/2)),0])union(){
     cube(size = [spacer_width+20,spacer_thickness, hm+20], center = true);
     translate([0,0,hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_length*4, r=rhs, center=true);
     translate([0,0,-hm/2.6]) rotate([90,0,0]) cylinder(h=spacer_length*4, r=rhs, center=true);
     }
}


//_________________________________________________________________________________
//main body
difference(){
difference(){
translate([0,(-tubeor+.1+shift-spacer_thickness/2),0])cube(size = [spacer_width,spacer_thickness, hm], center = true);
cylinder(h=hm*2, r=tubeor, center=true);
translate([0,(-tubeor+shift-spacer_thickness/2),0])drill_holes_tele(hm2,nbrholestele,spacer_length,rhh);
}

union(){
  machine_corners(theta);
  machine_corners(-theta);
}

}
//_________________________________________________________________________________

//testing the cylinder
if(0){
  color( "red" ) {
     rotate([0,0,theta])translate([0,(shift-tubeor-(3*spacer_thickness/2)),0])union(){
     cube(size = [spacer_width+20,spacer_thickness, hm+20], center = true);
     translate([0,0,hm/3]) rotate([90,0,0]) cylinder(h=spacer_length*4, r=rhs, center=true);
     translate([0,0,-hm/3]) rotate([90,0,0]) cylinder(h=spacer_length*4, r=rhs, center=true);
     }
      }
  }