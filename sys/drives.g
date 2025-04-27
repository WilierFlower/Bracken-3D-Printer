; Drives
M569 P0 S1      ; physical drive 0 goes forwards

M569 P1 S1      ; physical drive 1 goes forwards

M569 P2 S0      ; physical drive 2 goes backwards Z Drive

M569 P4 S0      ; physical drive 4 goes backwards Z Drive

M569 P3 S0      ; physical drive 3 goes backwards

M584 X0 Y1 Z4:2 E3  ; set drive mapping

M671 X-67.15:285.5 Y110:110 S2  ; Lead screw positions at right and left of the X axis

M350 X16 Y16 Z16 E16 I1  ; configure microstepping with interpolation

M92 X200.00 Y200.00 Z800.00 E690 ; set steps per mm

M569 P0 Y4:3:0 B2 C3  ;Adjusted X axis SpreadCycle Chopper

M569 P1 Y4:3:0 B2 C3  ;Adjusted Y axis SpreadCycle Chopper