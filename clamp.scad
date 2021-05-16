$fn=400;
scale=25.4;
hm=80;
w=14;
rlh=.1360*scale/2; //drill at .1360 to tap for 8-32 screws

//linear_extrude(3){
difference(){
square([hm,w],center=true);
translate([80/2.6,0]) circle(h=spacer_length*4, r=rhs, center=true);
translate([-80/2.6,0]) circle(h=spacer_length*4, r=rhs, center=true);
}

//}