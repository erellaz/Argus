// Base for Spider by 
// 12/14/2020
// Visit erellaz.com for additional documentation and workflow

scale=25.4;    // Inch to mm

//body
hm=80; //heigth  mm
spacer_width=40; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
spacer_thickness=15;



//holes
nbrholestele=3;
rha=.2010*scale/2;//for 1/4-20 tap, drill at 0.2010", closest fractional 13/64"
rhb=.25*scale/2;//for 1/4-20 no tapping

tubeod=12.88*scale/2;

rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws

shift=1.5;

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=400;




//_________________________________________________________________________________
module drill_holes_tele(hm,nbrholestele,spacer_length,rlh){
   spacing=20;
    for(j = [-1 : 1 : nbrholestele-2]){
     translate([0,0,(52/32)*scale+j*spacing-hm/2]) rotate([90,0,0]) cylinder(h=spacer_thickness*2, r=rhb, center=true);
    }
}
//_________________________________________________________________________________
//main body
difference(){
difference(){
cube(size = [spacer_width,spacer_thickness, hm], center = true);
drill_holes_tele(hm,nbrholestele,spacer_length,rlh);
}
translate([0,(tubeod-shift+spacer_thickness/2),0]) cylinder(h=hm*2, r=tubeod, center=true);
translate([spacer_width/3,-shift/2,-hm/2]) cylinder(h=18, r=rlh, center=true);
translate([-spacer_width/3,-shift/2,-hm/2]) cylinder(h=18, r=rlh, center=true);
}
//_________________________________________________________________________________
//testing the cylinder
if(0){
  color( "red" ) {
      translate([0,-shift/2,-hm/2]) cylinder(h=15, r=rlh, center=true);
      }
  }