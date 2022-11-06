; Stock code:

;Single 02 start
M140 S{material_bed_temperature};
M104 T1 S{material_print_temperature};
M280 P0 S160;
G4 P100;
G28;
T1
M190 S{material_bed_temperature};
M109 T1 S{material_print_temperature};
G92 E0;
G1 X10.1 Y20 Z0.28 F5000.0;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15;
G1 X10.4 Y200.0 Z0.28 F5000.0;
G1 X10.4 Y20 Z0.28 F1500.0 E30;
G92 E0 ;Reset Extruder
G1 Z2.0 F3000;

;----------------------------------------------

;modified code:

;Single 02 start G-code
M140 S{material_bed_temperature}; Start preheating the bed
G28; Home all axes
M190 S{material_bed_temperature} ; heat to bed setting in Cura and WAIT
G34; Run Z-Stepper auto align
G29; BLTOUCH Mesh Generation
M104 T1 S{material_print_temperature}; Start preheating the hotend
M280 P0 S160;
G4 P100;
T1
M109 T1 S{material_print_temperature};
G92 E0;
G1 X10.1 Y20 Z0.28 F5000.0;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15;
G1 X10.4 Y200.0 Z0.28 F5000.0;
G1 X10.4 Y20 Z0.28 F1500.0 E30;
G92 E0 ;Reset Extruder
G1 Z2.0 F3000;