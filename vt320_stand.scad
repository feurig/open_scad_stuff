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
crossOffset=12;
mainHookRadius=136.5/2;
mainHookWidth=5.25;
standHeight=20;
standWidth=150;
armSlotWidth=44;
armSlotCenter=26;
armSlotThickness=2.5;
armSlotDepth=5.0;
F2Width=12.0;

cableBoxLength=40.0;
cableBoxWidth=118;
cableBoxWallThickness=2;
dW=cableBoxWallThickness*2.0;
etherNetHeight=17.0;
etherNetDepht=25.0;
etherNetLength=106.6;
piBoxDepth=80; 
piBoxWidth=136; 

module vt320_stand_rear_hook(){
    difference(){
        union(){
                translate([standHeight/2,0,piBoxDepth/2]){cube([standHeight,standWidth,piBoxDepth],center=true);}
                translate([0,0,slotDepth*2]){
                    rotate([180,0,0]){
                        translate([-slotDepth,mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                        translate([-slotDepth,-mainHookRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                        translate([-slotDepth*1.5,mainHookRadius+3,slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
                        translate([-slotDepth*1.5,-(mainHookRadius+3),slotWidth/2.0]){cube([slotDepth,6,slotWidth],center=true);}
                    }
                }
        }
        translate([(standHeight+dW)/2,0,piBoxDepth/2+dW]){cube([standHeight,piBoxWidth-dW,piBoxDepth],center=true);}
        translate([standHeight,50.5,0]){
            rotate([0,-45,0]){
                cylinder(d=14,h=slotWidth*6,center=false);
            }
        }


        translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=cableBoxWidth,center=false);}
        translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=cableBoxWidth,center=false);}    
    }
}
module vt320_stand_front_hook(){
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
        translate([standHeight/2.0,70.5,-2.0]){cylinder(d=5.5,h=F2Width*2,center=false);}
        translate([standHeight/2.0,-70.5,-2.0]){cylinder(d=5.5,h=F2Width*2,center=false);}
        captive_nut_hole(location=[standHeight/2.0,70.5,-0.5]);
        captive_nut_hole(location=[standHeight/2.0,-70.5,-0.5]);
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
module vt320_stand_end(){
    rotate([0,180,0]){
        difference(){
            union(){
                translate([0,0,0]) {rotate([0,90,0]){vt320_cable_box();}}
                translate([0,0,-crossOffset]){
                    translate([standHeight/2,0,crossOffset-(slotWidth)]){cube([standHeight,standWidth,slotWidth*2],center=true);}
                    translate([-slotDepth,crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                    translate([-slotDepth,-crossCenterRadius,slotWidth]){cube([slotDepth*2,slotWidth,slotWidth*2],center=true);}
                    translate([-slotDepth*1.5,crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
                    translate([-slotDepth*1.5,-crossCenterRadius,slotWidth/2.0]){cube([slotDepth,8,slotWidth],center=true);}
                } 
            }

            translate([standHeight,50.5,0]){
                rotate([0,270-45,0]){
                    cylinder(d=14,h=slotWidth*6,center=false);
                    }
            }
            translate([standHeight/2.0,70.5,-12.0]){cylinder(d=5.5,h=standHeight,center=false);}
            translate([standHeight/2.0,-70.5,-12.0]){cylinder(d=5.5,h=standHeight,center=false);}
        }
    }
}

module vt320_cable_box(){
    difference(){
        union(){

            difference(){
                translate([(cableBoxLength/2),0,standHeight/2]){
                    cube([cableBoxLength,cableBoxWidth+dW,standHeight],center=true);
                }
        
                //inner wall   
                translate([((cableBoxLength)/2)+(dW*2),0,(etherNetHeight+dW)/2]){
                    cube([cableBoxLength+dW,cableBoxWidth,etherNetHeight],center=true);
                }
            }
            translate([(cableBoxLength/2),(etherNetLength/2)-18,standHeight/2]){
                cube([cableBoxLength,dW,standHeight],center=true);
            }
        }
        
        //hole for ethernet adapter   
        translate([cableBoxLength-((dW+etherNetDepht)/2),-dW*2,(etherNetHeight+dW)/2]){
            cube([etherNetDepht,etherNetLength,etherNetHeight],center=true);
        }
    }
}

//translate([0,0,0]){ vt320_stand_end(); }
vt320_stand_rear_hook();
//vt320_cable_box();
//translate([0,0,0]){ vt320_pi_box(); }
//translate([standHeight+10,0,0]) {vt320_stand_rear_hook();}
//translate([(standHeight+10)*2.0,0,0]){vt320_stand_front_hook();}
//translate([(standHeight+10)*3,0,0]){vt320_arm_mount();}
//translate([(standHeight+10)*4,0]){vt320_arm_mount();}
