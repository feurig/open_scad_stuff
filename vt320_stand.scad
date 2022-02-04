//------------------------------------------------------------- pipe_clamp.scad
use <screwey.scad>;

$fa = 1;
$fs = 0.4;
slotWidth=3.5;
slotDepth=3.5;
standHeight=10;

union(){
    translate([standHeight/2,0,slotWidth]){cube([standHeight,150,slotWidth*2],center=true);}
    translate([-slotDepth,61.6,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
    translate([-slotDepth,-61.6,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
    translate([-slotDepth*1.5,61.6,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
    translate([-slotDepth*1.5,-61.6,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
}