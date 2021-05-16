// Base for Spider
// 12/14/2020
// Note: I had to break down the differences to make the file work in Freecad

scale=25.4;    // Inch to mm

//Main disk
dm=80; //External diameter mm
hm=12; //heigth  mm

//central hole
soffset=3.8; //Secondary offset
dh=10.2; //diameter hole

//cone
b=25;

//indent 
wi=2.28;
hi=15;

//rotation
r=-122.5; 
adjust=-.5;

//resolution
//$fn=150;

module indent(dm,hi,wi){
translate([(dm)/2,0,0]) rotate([0,90,0])cylinder(h=hi,d=wi, center=true);
    }
    
//module conicalhole(){
//    translate([soffset,0,0]) union(){
//            cylinder(h=hm*3, d=dh, center=true); //the hole
//            translate([0,0,-1]) cylinder(h=hm+5, r1=1,r2=b/2, center=true); 
//            }
//       }
//_________________________________________________________________________________
module mainbody(){
difference(){

    cylinder(h=hm, d=dm, center=true); //the disk
    
    union(){//the screw holes
    translate([soffset,0,0])cylinder(h=hm*3, d=dh, center=true); //the hole
    rotate([0,0,r+155]) translate([(dm)/2,0,0]) cylinder(h=hm+5,d=7, center=true);//the notch
    rotate([0,0,r+0])    indent(dm,hi,wi);
    rotate([0,0,r+110+adjust])  indent(dm,hi,wi);// closing screw 2
    rotate([0,0,r+135+adjust])  indent(dm,hi,wi);//closing scew 1
    rotate([0,0,r-120]) indent(dm,hi,wi);
    }
    
}
}

difference(){
    mainbody();
    translate([soffset,0,-1]) cylinder(h=hm+5, r1=1,r2=b/2, center=true); 
}


//_________________________________________________________________________________
//if(0){
//  color( "blue" ) {
//    //cylinder(h=hm+1, d1=0,d2=b, center=true); //the hole
//    rotate([0,0,150]) translate([(dm)/2,0,0]) cylinder(h=hm+5,d=7, center=true);
//   }
//}
//_________________________________________________________________________________
if(0){
  color( "blue" ) {
    translate([soffset,0,50]) union(){
            cylinder(h=hm*3, d=dh, center=true); //the hole
            translate([0,0,-1]) cylinder(h=hm+5, r1=1,r2=b/2, center=true); 
            }  
  }
}