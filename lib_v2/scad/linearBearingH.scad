// linear bearings 
// LLxUU: LL8UU, LL6UU
// LMKxUU: LMK8UU, LMK6UU, LMK8SUU

include <../scad/globalParams.scad>

// [0] strName [1]M/2, [2]Length, [3]Diameter/2, [4]slotDiameter/2, [5]slotWidth, [6]slotDistance
LL6UU = ["LL6UU", 3, 19, (12/2), (11.5/2), 1.1, 11.3];
LL8UU = ["LL8UU", 4, 24, (15/2), (14.3/2), 1.1, 15.3];

// [0]str name, [1]M/2, [2]Length, [3]Diameter/2, [4]supportDiameter/2, [5]supportHeight, 
// [6]supportHolesSmall/2, [7]supportHolesBig/2, [8]supportHolesBigHeight, [9]supportHolesPosDiam/2, 
LMK6UU = ["LKM6UU", 3, 19, (12/2), (28/2), 5, (3.5/2), (6/2), 3.1, (20/2)];
LMK8UU = [ "LKM8UU", 4, 24, (15/2), (32/2), 5, (3.5/2), (6/2), 3.1, (24/2)];
LMK8SUU = ["LKM8SUU", 4, 17, (15/2), (32/2), 5, (3.5/2), (6/2), 3.1, (24/2)];