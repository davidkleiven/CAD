use <supports.scad>;
supports(2.0, 50.0, 5, 30.0);
translate([0, -8.0,0])
scale([1, 0.3, 0.25])
lane(20.0);

color([0.168, 0.549, 0.745])
translate([10, 0, 56.5])
sphere(10.0);

color([0.3, 0.3, 0.3])
translate([-30, -10, -5])
cube([60.0, 170.0, 5.0]);