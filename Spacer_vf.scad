// Base for Spider by 
// 12/14/2020
// Visit erellaz.com for additional documentation and workflow

scale=25.4;    // Inch to mm

//body
hm=50; //heigth  mm
vane_spacing=14; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
spacer_length=15; //the length of the spacer inside the telescope, 

//holes for vanes
rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws
//rlh=((0.089)*(scale))/2; //for 4-40 tap, drill at 0.089", closest fractional 3/32"=0.094"
nbrholes=3;
echo(rlh);

//holes
nbrholestele=2;
rha=.2010*scale/2;//for 1/4-20 tap, drill at 0.2010", closest fractional 13/64"

tubeid=12.61*scale/2;

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=250;




//_________________________________________________________________________________
//the holes to mount the vanes
module drill_holes(hm,nbrholes,vane_spacing,rlh){
   spacing=hm/(nbrholes*2);
    for(j = [0 : 1 : nbrholes-1]){
     translate([0,0,(nbrholes-1-2*j)*spacing]) rotate([0,90,0]) cylinder(h=vane_spacing*2, r=rlh, center=true);
    }
}

// the 1/4 holes through the tube
module drill_holes_tele(hm,nbrholestele,spacer_length,rla){
   spacing=hm/(nbrholestele*3);
    for(j = [0 : 1 : nbrholestele-1]){
     translate([0,0,(nbrholestele-1-2*j)*spacing]) rotate([90,0,0]) cylinder(h=spacer_length*2, r=rha, center=true);
    }
}
//_________________________________________________________________________________
//main body
intersection(){
difference(){
cube(size = [vane_spacing,spacer_length, hm], center = true);
drill_holes(hm,nbrholes,vane_spacing,rlh);
drill_holes_tele(hm,nbrholestele,spacer_length,rlh);
}
translate([0,-1*(tubeid-spacer_length/2),0]) cylinder(h=hm*2, r=tubeid, center=true);
}
//_________________________________________________________________________________
//testing the cylinder
if(0){
  color( "red" ) {
      translate([0,-1*(tubeid-spacer_length/2),0]) cylinder(h=hm*2, r=tubeid, center=true);
      }
  }