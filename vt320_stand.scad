//------------------------------------------------------------- pipe_clamp.scad
use <screwey.scad>;

$fa = 1;
$fs = 0.4;
slotWidth=2.75;
slotDepth=3.75;
crossCenterRadius=58.95;
mainHookRadius=132/2;
mainHookWidth=6;
standHeight=10;
standWidth=150;
module vt320_stand_end(){
    difference(){
        union(){
                translate([standHeight/2,0,slotWidth]){cube([standHeight,150,slotWidth*2],center=true);}
                translate([-slotDepth,crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                translate([-slotDepth,-crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                translate([-slotDepth*1.5,crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
                translate([-slotDepth*1.5,-crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
            }
        translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
        translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
    }
}

module vt320_stand_main(){
    difference(){
    union(){
            translate([standHeight/2,0,slotWidth]){cube([standHeight,150,slotWidth*2],center=true);}
            translate([-slotDepth,mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth,-mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth*1.5,mainHookRadius+3,slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
            translate([-slotDepth*1.5,-(mainHookRadius+3),slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
        }
            translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
            translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
    }
}

//module vt320_stand_mount_hook(){
    difference(){
    union(){
            translate([standHeight/2,0,slotWidth]){cube([standHeight,150,slotWidth*2],center=true);}
            translate([-slotDepth,mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth,-mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth*1.5,mainHookRadius+3,slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
            translate([-slotDepth*1.5,-(mainHookRadius+3),slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
        }
            translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
            translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
    }
}


