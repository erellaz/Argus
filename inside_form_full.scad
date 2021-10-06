// Paul Richard
// 6/6/21
// Dust Cover for 2 inches focuser

//General parameters
$fn=100;
scale=25.4;    // Inch to mm

// Main hoop
id=12.61*scale;
stepback=0.2;
thickness=12;

//indents
n=36;
ri=2;

//inside indents
m=6;
rt=10;
rc=0.165*scale/2; // for 8-32 no tapping

//extrusion
he=8;

r_ring=id/2-(stepback+ri);

//linear_extrude(height=he){
difference(){
union(){
difference(){
circle(r = r_ring);
circle(r = r_ring-thickness);
}

// Indents
for (a =[0:n]){
    rotate([0,0,a*(360/n)])translate([r_ring,0,0])circle(r=ri);
    } 


for (a =[0:m]){
    rotate([0,0,a*(360/m)])translate([3+id/2-(stepback+rt+thickness/2),0,0])    
    circle(r=rt);
    }     
    
}

for (a =[0:m]){
    rotate([0,0,a*(360/m)])translate([3+id/2-(stepback+rt+thickness/2),0,0])    
    circle(r=rc);
    } 
}
//}

if(0){
color("red"){
    translate([0,0,-4])cylinder(r=id/2,h=3);
}
}