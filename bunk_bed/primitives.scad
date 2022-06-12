PILLAR_WIDTH = 48;
PILLAR_DEPTH = 98;

HOR_WIDTH = PILLAR_WIDTH;
HOR_DEPTH = 148;

MADRASS_SUP_WIDTH = 23;
MADRASS_SUP_SEP = 300;

ROOM_WIDTH = 2100;
BED_HEIGHT = 1800;
BED_WIDTH = 900;
UPPER_BED_BOTTOM = 1400;

LADDER_WIDTH = 600;
LADDER_STEP_HEIGHT = 300;

module two_two(height) {
    color("#1b9e77"){cube([PILLAR_WIDTH, PILLAR_WIDTH, height]);};
};

module two_four(height) {
    color("#d95f02"){cube([PILLAR_WIDTH, PILLAR_DEPTH, height]);};
}

module two_six(height) {
    color("#7570b3"){cube([HOR_WIDTH, HOR_DEPTH, height]);};
}

module one_four(height) { 
    color("#e7298a"){cube([MADRASS_SUP_WIDTH, PILLAR_DEPTH, height]);};
}