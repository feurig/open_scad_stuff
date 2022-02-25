/* ------------------------------------------ open_scad_stuff/vt320_stand.scad

 Build a vt320 vesa stand adapter that will house a raspberry pi and an rs232
 adapter.

This design requires 2 threaded rods and at least 6 matching nuts. 
 (c) CopyLeft 2022 D Delmar Davis <don@suspectdevices.com> (2clausBSD) 
 ----------------------------------------------------------------------------*/

use <screwey.scad>;

$fa = 1;
$fs = 0.4;
slotWidth=2.75;
slotDepth=3.75;
crossCenterRadius=58.95;
mainHookRadius=136.5/2;
mainHookWidth=5.25;
standHeight=20;
standWidth=150;
armSlotWidth=44;
armSlotCenter=26;
armSlotThickness=2.5;
armSlotDepth=5.0;
F2Width=12.0;
module vt320_stand_end(){
    difference(){
        union(){
                translate([standHeight/2,0,slotWidth]){cube([standHeight,standWidth,slotWidth*2],center=true);}
                translate([-slotDepth,crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                translate([-slotDepth,-crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                translate([-slotDepth*1.5,crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
                translate([-slotDepth*1.5,-crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
            }
        translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
        translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
    }
}

module vt320_stand_F1(){
    difference(){
    union(){
            translate([standHeight/2,0,slotWidth]){cube([standHeight,standWidth,slotWidth*2],center=true);}
            translate([-slotDepth,mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth,-mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth*1.5,mainHookRadius+3,slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
            translate([-slotDepth*1.5,-(mainHookRadius+3),slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
        }
            translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
            translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
    }
}
module vt320_stand_F2(){
    difference(){
    union(){
            translate([standHeight/2,0,F2Width/2.0]){cube([standHeight,standWidth,F2Width],center=true);}
            translate([-slotDepth,mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth,-mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
            translate([-slotDepth*1.5,mainHookRadius+3,slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
            translate([-slotDepth*1.5,-(mainHookRadius+3),slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
        }
            // slot for arm
            translate([standHeight-armSlotDepth,0,0]){cube([armSlotThickness,armSlotWidth,standHeight*8],center=true);}
            translate([standHeight,0,0]){cube([armSlotThickness+armSlotDepth,armSlotCenter,standHeight*8],center=true);}
            translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
            translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*4,center=false);}
            captive_nut_hole(location=[standHeight/2.0,70.5,0.0]);
            captive_nut_hole(location=[standHeight/2.0,-70.5,0.0]);
    }
}



module vt320_arm_mount(){
    difference(){
    
            translate([standHeight/2,0,slotWidth*4]){cube([standHeight,standWidth,slotWidth*8],center=true);}
            translate([standHeight-armSlotDepth,0,0]){cube([armSlotThickness,armSlotWidth,standHeight*8],center=true);}
            translate([standHeight,0,0]){cube([armSlotThickness+armSlotDepth,armSlotCenter,standHeight*8],center=true);}
            translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=slotWidth*16,center=false);}
            translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=slotWidth*16,center=false);}
    }
}

piBoxLength=85.0;
piBoxWidth=110;
piBoxWallThickness=2;
dW=piBoxWallThickness*2.0;
etherNetHeight=15.9;
etherNetDepht=24;
etherNetLength=106.6;

module vt320_pi_box(){
    difference(){
        //outer wall
        union (){
            translate([piBoxLength/2,0,standHeight/2]){
                cube([piBoxLength,piBoxWidth+dW,standHeight],center=true);
            }
            translate([piBoxWallThickness,0,standHeight/2]) { 
                cube([dW,standWidth+dW,standHeight],center=true);
 
            }}
        //inner wall   
        translate([(piBoxLength)/2,0,(standHeight+dW)/2]){
            cube([piBoxLength-dW,piBoxWidth,standHeight],center=true);
        }
        //hole for ethernet adapter   
        translate([piBoxLength-((dW+etherNetDepht)/2),standWidth/2,(etherNetHeight+dW)/2]){
            cube([etherNetDepht,standWidth,etherNetHeight],center=true);
        }
        // mounting holes.
        translate([-2,70.5,standHeight/2.0]){
            rotate([0,90,0]){
                cylinder(d=5.5,h=slotWidth*4,center=false);
                }
        }
        translate([-2,-70.5,standHeight/2.0]){
            rotate([0,90,0]){
                cylinder(d=5.5,h=slotWidth*4,center=false);
                }
        }
    }
}

//translate([0,0,0]){ vt320_pi_box(); }
//translate([standHeight+10,0,0]) {vt320_stand_F1();}
translate([(standHeight+10)*2.0,0,0]){vt320_stand_F2();}
//translate([(standHeight+10)*3,0,0]){vt320_arm_mount();}
//translate([(standHeight+10)*4,0]){vt320_arm_mount();}
