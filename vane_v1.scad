// Base for Spider
// 12/14/2020
// Note: I had to break down the differences to make the file work in Freecad

scale=25.4;    // Inch to mm

//Main cube
hm=50; //heigth  mm
vl=137; //vane length
setback=7;



//holes
nbrholes=3;
//holes for vanes
rlh=0.164*scale/2; // 0.164" for 8/32 screws
spacing=hm/(nbrholes*2);

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=250;

//_________________________________________________________________________________
//the holes to mount the vanes
module drill_vane_holes(rlh,spacing,nbrholes){
   for(j = [0 : 1 : nbrholes-1]){
     translate([(nbrholes-1-2*j)*spacing,vl/2-setback,0])  circle(r=rlh, center=true);
     translate([(nbrholes-1-2*j)*spacing,-vl/2+setback,0])  circle(r=rlh, center=true);
    }
}


//build the body, remove the cut outs, drill the holes
linear_extrude(2)
difference(){
square(size = [ hm, vl], center = true);
drill_vane_holes(rlh,spacing,nbrholes);
}

//_________________________________________________________________________________
//Here we test the various parts individually
//_________________________________________________________________________________
//testing
if(0){
  color( "blue" ) {
for(j = [0 : 1 : nbrholes-1]){
     translate([(nbrholes-1-2*j)*spacing,vl-setback,0])  circle(r=rlh, center=true);
    }
  }
}

//_________________________________________________________________________________
//testing 
if(0){
  color( "red" ) {
      }
  }