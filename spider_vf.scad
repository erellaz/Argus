// Base for Spider by 
// 12/14/2020
// Visit erellaz.com for additional documentation and workflow

scale=25.4;    // Inch to mm

//Main disk
dm=73; //External diameter mm
dc=35;
hm=50; //heigth  mm
conification=.94;//percentage of conification, making the top smaller than the base

//central hole
dh=(3/8)*(scale);//=9.5; //diameter hole for 3/8" screw, not tapped

// Notch
dnotch=7; //diameter notch in mm
rnotch=32.5; //positional angle of notch in degree


//holes for vanes
rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws
//rlh=((0.089)*(scale))/2; //for 4-40 tap, drill at 0.089", closest fractional 3/32"=0.094"
nbrholes=3;
echo(rlh);
hlh=50; //height of assembly in mm
percvaneholes=.70;

//filet
fi=14; //this value in mm should be greater than vane_spacing

//spacing between 2 parallel vanes
vane_spacing=14; //we need to allo for 2 1/4" screws, so a little over 1/2 thickness, ie over 12.7mm
x=vane_spacing/2;


// The base
hb=6.5; //thickness of base mm
cs=3; //number of collimation screws, should be 3 or 4
rot=60; //rotation factor in degree
perc=.82; //percentage of the diameter to place the collimation holes
rlhb=(5/16)*(scale)/2;//7.9/2; //The holes in the base, 5/16", not tapped

//hole to axis
//holes
rha=.2010*scale/2;//for 1/4-20 tap, drill at 0.2010", closest fractional 13/64"


//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
//$fn=250;

//_________________________________________________________________________________
//main body
module body(hm,dm){
difference(){
cylinder(h=hm, r1=.5*dm,r2=.5*conification*dm, center=true); //the body
//cube(size = [dm, dm, hm], center = true);
cylinder(h=hm+20, d=dh, center=true); //the hole
}
}

//The 3 cut outs of the main body
module cutter(dm,hm){
 for(i = [0 : 120 : 360]){
     //rotate([0,0,i]) translate([dm/6,0,-hm]) cube(size = [dm, dm, hm*2], center = false);
    rotate([0,0,i]) union(){
    translate([x,x+fi,-hm]) cube(size = [dm, dm, hm*2], center = false);
    translate([x+fi,x,-hm]) cube(size = [dm, dm, hm*2], center = false);
    translate([x+fi,x+fi,0]) cylinder(h=hm*2, r=fi, center=true);
    }
}

for(i = [30 : 120 : 390]){
     //rotate([0,0,i]) translate([dm/6,0,-hm]) cube(size = [dm, dm, hm*2], center = false);
    rotate([0,0,i]) union(){
    translate([x,x+fi,-hm]) cube(size = [dm, dm, hm*2], center = false);
    translate([x+fi,x,-hm]) cube(size = [dm, dm, hm*2], center = false);
    translate([x+fi,x+fi,0]) cylinder(h=hm*2, r=fi, center=true);
    }
}
// The following formula deserves a bit of explanation:
// the cylinders have their center on a circle of radius sqrt(2)*(x+fi)
// and 2 adjacent cylinders are 30 degrees apart
// hence the flat part should be at cos(15)*sqrt(2)*(x+fi)
for(i = [0 : 120 : 360]){
    rotate([0,0,i+60])translate([cos(15)*sqrt(2)*(x+fi),0,0])cube(size = [2*fi, fi, 1.2*hm], center = true);
}

}


//the holes to mount the vanes
module drill_holes(dm,hm,hlh,rlh){
   spacing=hm/(nbrholes*2);
    for(i = [0 : 120 : 360]){
    for(j = [0 : 1 : nbrholes-1]){
     rotate([0,0,i])  translate([percvaneholes*dm/2,0,(nbrholes-1-2*j)*spacing]) rotate([90,0,0]) cylinder(h=hlh, r=rlh, center=true);
    }
}
}

//the holes to the axis
module drill_holes_to_axis(hm,rha){
    for(i = [0 : 120 : 360]){
    rotate([0,0,i]) translate([-15,0,hm/5]) rotate([0,90,0]) cylinder(h=30, r=rha, center=true);
    rotate([0,0,i]) translate([-15,0,-hm/5]) rotate([0,90,0]) cylinder(h=30, r=rha, center=true);
    }
}

// The base for colimation screws
module collimation_base(hb,hm,dm,dh,rlh){
    difference(){
        translate([0,0,-(hb+hm)/2])cylinder(h=hb, d=dm, center=true);  //base body
        cylinder(h=hm+20, d=dh, center=true); //the hole
        for(i = [0 : 360/cs : 360]){ //the holes for collimation screw
         rotate([0,0,i+rot])  translate([perc*dm/2,0,0]) cylinder(h=4*hm, r=rlhb, center=true);   
        }
    }
}

// The notch to pass the secondary heater cables
module make_notch(dm,hm,dnotch,rnotch){
rotate([0,0,rnotch]) translate([(dm)/2,0,-hm/2]) cylinder(h=hm,d=dnotch, center=true);//the notch
}
//_________________________________________________________________________________
//build the body, remove the cut outs, drill the holes
union(){
    difference(){
        body(hm,dm);
        cutter(dm,hm);
        drill_holes(dm,hm,hlh,rlh);
        drill_holes_to_axis(hm,rha);
        }
    difference(){
        collimation_base(hb,hm,dm,dh);
        make_notch(dm,hm,dnotch,rnotch);
        }
}



//_________________________________________________________________________________
//Here we test the various parts individually
//_________________________________________________________________________________
//testing the cut out
if(0){
  color( "blue" ) {
      //for(i = [25 : 60 : 60]){
         rotate([0,0,60])translate([cos(15)*sqrt(2)*(x+fi),0,0])cube(size = [2*fi, fi, 1.2*hm], center = true);
  }
  //}
}

//_________________________________________________________________________________
//testing the cylinders
if(0){
  color( "red" ) {
      for(i = [0 : 30 : 30]){
      rotate([0,0,i]) translate([x+fi,x+fi,0]) cylinder(h=hm*1.4, r=fi, center=true);
      }
  }
    
}
//_________________________________________________________________________________
//testing the notch
if(0){
  color( "green" ) {
  make_notch(dm,hm,dnotch,rnotch);
      }  
}