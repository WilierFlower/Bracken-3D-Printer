; Miscellaneous
M501
;M593 P"zvddd" F50
M593 P"mzv" F50

T0      ; select first tool
M18     ; release / unlock X, Y, and E axis
;M501    ; use config-override (for Thermistor Parameters and other settings)
G90     ; send absolute coordinates...
M83     ; ... but relative extruder moves


;M955 P0 I25 C"spi.cs2+spi.cs1" ; all wires connected to temp DB connector, no temperature daughterboard