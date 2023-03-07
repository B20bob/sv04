; PrusaSlicer Single T0 End gCode

G91; relative positioning
G1 E-2 F2700; retract a bit
G1 E-2 Z0.2 F2400; retract and raise Z
G1 X0 Y240 F3000; wipe out
G1 Z10; raise Z more
G90; absolute positioning
T0 G1 X0 Y300 ; Present Print
M106 S0; turn off fan
M104 S0; turn off hotend
M140 S0; turn off bed
M84 X Y E; disable all steppers but Z