//Parametric Version of Glifo for careables.org
//dw@prototypes.berlin
//based on https://www.welder.app/careables.org/glifo.-.writing.tool/

//Press F6 after changing the parameters!


//outer dimensions

w_handle=13; // [10:100] 
y_handle=60; // [24:100] 


material_thickness = 4.5; //[1:8]

glifo();

module glifo(){

//import STL and cut the handle
difference(){
translate([-34.5,-12,0])
    import("Files_L_HANDGRIP.STL");
cube([80,24,50],true);
}

y_handle_sq=y_handle-w_handle;

translate([0,if (w_handle <= 24) abs(w_handle-24)/2 else (abs(w_handle-24)*(-1)/2),0]){
difference(){
    linear_extrude(17){
    square([y_handle_sq,w_handle],true);
    translate([-0.5*y_handle_sq,0,0])
        circle(d=w_handle, $fn=50);
    
    translate([0.5*y_handle_sq,0,0])
        circle(d=w_handle, $fn=50);}
 
 //make hole into handle       
 translate([0,0,-1]){ 
    linear_extrude(20){
    square([y_handle_sq,w_handle-material_thickness],true);
    translate([-0.5*y_handle_sq,0,0])
        circle(d=w_handle-material_thickness, $fn=50);
    
    translate([0.5*y_handle_sq,0,0])
        circle(d=w_handle-material_thickness, $fn=50);}
    }   
} 
}    
}
