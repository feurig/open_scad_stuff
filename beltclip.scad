// -------------------------------------------------------------beltclip.scad
//
//
//
//
$fa = 1;
$fs = 0.4;
clipLength=32.00;
clipHeight=3.0;
clipWidth=22.0;
clipHoleWidth=11.0;
clipHoleLength=22.0;

difference (){

translate([-(clipWidth/2.0),0,0]){
     cube([clipWidth,clipLength,clipHeight], center=false);
}
translate([-(clipHoleWidth/2.0),(clipLength-clipHoleLength)/2.0,-2.0]){
     cube([clipHoleWidth,clipHoleLength,clipHeight+4], center=false);
}
}