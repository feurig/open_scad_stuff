postCardHeight=105;
postCardWidth=150;
translate([0,postCardHeight,0]){
rotate([-180,0,0]){

difference(){
square([postCardWidth,postCardHeight] , center=false);
translate([postCardWidth/2,5,0]){
rotate([180,0,90]){
text(text="3DAngst 7900 N Washburne, Ave PDX OR 97217",size=3,font="Comic Sans");
}}
}}}