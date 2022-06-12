include <primitives.scad>;

module pillars () {
    two_four(UPPER_BED_BOTTOM);
    dx = 2*PILLAR_WIDTH + BED_WIDTH;
    
    translate([dx, 0, 0]) {
        two_four(UPPER_BED_BOTTOM + HOR_DEPTH);
   };
   
   dy = ROOM_WIDTH - PILLAR_DEPTH;
   translate([0, dy, 0]){two_four(UPPER_BED_BOTTOM);};
   translate([dx, dy, 0]){two_four(BED_HEIGHT-PILLAR_WIDTH);};
   
   translate([dx, LADDER_WIDTH, 2*HOR_DEPTH]){two_two(BED_HEIGHT-2*HOR_DEPTH);};
}

module supports() {
    // Lower bed
    // Long
    translate([0, ROOM_WIDTH-PILLAR_DEPTH, 2*HOR_DEPTH]){
        rotate([90, 0, 0]){two_six(ROOM_WIDTH-2*PILLAR_DEPTH);};
    };
    
    translate([BED_WIDTH+PILLAR_WIDTH, ROOM_WIDTH, 2*HOR_DEPTH]){
        rotate([90, 0, 0]){two_six(ROOM_WIDTH);};
    };
    
    // Short
    translate([PILLAR_WIDTH, 0, 2*HOR_DEPTH]){rotate([90, 0, 90]){two_six(BED_WIDTH);};};
    
    translate([PILLAR_WIDTH, ROOM_WIDTH - PILLAR_WIDTH, 2*HOR_DEPTH]){rotate([90, 0, 90]){two_six(BED_WIDTH);};};
    
    // Upper bed
    // Long
    translate([0, ROOM_WIDTH, UPPER_BED_BOTTOM]){rotate([90, 0, 0]){two_six(ROOM_WIDTH);};};
    
    translate([BED_WIDTH+PILLAR_WIDTH, ROOM_WIDTH, UPPER_BED_BOTTOM]){
        rotate([90, 0, 0]){two_six(ROOM_WIDTH);};
    };
    
    // Short
    translate([PILLAR_WIDTH, 0, UPPER_BED_BOTTOM]){rotate([90, 0, 90]){two_six(BED_WIDTH);};};
    
    translate([PILLAR_WIDTH, ROOM_WIDTH - PILLAR_WIDTH, UPPER_BED_BOTTOM]){rotate([90, 0, 90]){two_six(BED_WIDTH);};};  
};

module safety() {
    translate([2*PILLAR_WIDTH + BED_WIDTH, ROOM_WIDTH, BED_HEIGHT-PILLAR_WIDTH]){rotate([90, 0, 0]){two_two(ROOM_WIDTH - LADDER_WIDTH);};};
    
    translate([2*PILLAR_WIDTH + BED_WIDTH, ROOM_WIDTH - PILLAR_DEPTH, BED_HEIGHT-3*PILLAR_WIDTH]){rotate([90, 0, 0]){two_two(ROOM_WIDTH - LADDER_WIDTH - PILLAR_DEPTH);};};
}

module ladder_steps() {
    dx = 2*PILLAR_WIDTH + BED_WIDTH;
    ladder_start = 2*HOR_DEPTH + LADDER_STEP_HEIGHT;
    for (i = [0:3]){
        translate([dx, LADDER_WIDTH + PILLAR_WIDTH, ladder_start + i*LADDER_STEP_HEIGHT]){rotate([90, 90, 0]){two_four(LADDER_WIDTH + PILLAR_WIDTH);};};
    }
};

module internal_supports() {
    width = ROOM_WIDTH - 2*PILLAR_WIDTH;
    translate([PILLAR_WIDTH, ROOM_WIDTH-PILLAR_WIDTH, 2*HOR_DEPTH]){rotate([90, 0, 0]){two_two(width);};};
    
    translate([BED_WIDTH, ROOM_WIDTH-PILLAR_WIDTH, 2*HOR_DEPTH]){rotate([90, 0, 0]){two_two(width);};};
    
    translate([PILLAR_WIDTH, ROOM_WIDTH-PILLAR_WIDTH, UPPER_BED_BOTTOM]){rotate([90, 0, 0]){two_two(width);};};
    
    translate([BED_WIDTH, ROOM_WIDTH-PILLAR_WIDTH, UPPER_BED_BOTTOM]){rotate([90, 0, 0]){two_two(width);};};
};

module madrass_support(height) {
    start = MADRASS_SUP_SEP/2;
    for (i = [0:6]) {
        translate([PILLAR_WIDTH, start + i*MADRASS_SUP_SEP, height + PILLAR_WIDTH + MADRASS_SUP_WIDTH]){rotate([90, 90, 90]){one_four(BED_WIDTH);};};
    }
}
pillars();
supports();
safety();
ladder_steps();
internal_supports();
madrass_support(2*HOR_DEPTH);
madrass_support(UPPER_BED_BOTTOM);