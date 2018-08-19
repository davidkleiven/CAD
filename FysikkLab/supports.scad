$fn = 30;
module supports(radius, height, num, disp){
    c = [0.74, 0.74, 0.74];
    
    for (i=[0:num]){
        color(c)
        translate([0, i*disp, 0])
        cylinder(height, radius, radius, True);
    }
   
}

$fn = 50;
module lane(width){
    color([0.99, 0.68, 0.41])
    rotate([90, 0, 90])
    linear_extrude (height=width)
	import(file = "path.dxf");
}
lane(40.0);