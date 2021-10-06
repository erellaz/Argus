// Erellaz
// 6/6/21
// form for carbone cap

$fn=360;
scale=25.4;
id=12.61*scale;

ht=10;
thickness=8;
sector=45; // size in degree of the sector

re=id/2;
ri=re-thickness;

difference(){
    difference(){
        cylinder(h = ht, r = re, center = true);
        cylinder(h = ht*2, r = ri, center = true);
        }
    
    union(){
        translate([0,0,-ht])cube([re*2,re*2,ht*2]);
        rotate([0,0,90+sector])translate([0,0,-ht])cube([re*2,re*2,ht*2]);
        translate([-re,5-2*re,-ht])cube([re*2,re*2,ht*2]);
        }
    }