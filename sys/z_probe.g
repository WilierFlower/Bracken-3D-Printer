; z_probe.g - Simplified Z Offset Calculation

M558 P5 C"^zprobe.in" F120 H1.0 R0 A3 S0.005 T22800   ; Configure Z-Probe
G31 P1000 X22.5 Y5                                    ; Set probe offsets
M557 X10:210 Y10:210 S50                              ; Define probing grid
G31 Z0.28

