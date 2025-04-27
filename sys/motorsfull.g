;This is for setting the X & Y steppers back to 100% Torque and such after doing stall detection

M913 X100 			; XY motors to 100% current
M915 X S64 R0 F0 	; set X sensitivity high, do nothing when stall, unfiltered
M913 Y100 			; XY motors to 100% current
M915 Y S64 R0 F0 	; set X sensitivity high, do nothing when stall, unfiltered
M913 Z 100
M915 Z S64 R0 F0