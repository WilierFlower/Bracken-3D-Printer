; bed.g
; Called to perform automatic bed compensation via G32

M561                                                      ; Clear any bed transform
G90
; Check if the printer is not homed
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28                                                   ; Home all axes if not already homed

G90

while iterations <= 1                                     ; Do minimum of 2 passes
    G30 P0 X5 Y110 Z-99999                                ; Probe near a leadscrew, half way along Y axis
    G30 P1 X215 Y110 Z-99999 S2                           ; Probe near a leadscrew and calibrate 2 motors
    G90

while move.calibration.initial.deviation >= 0.002         ; Perform additional tramming if previous deviation was over 0.002mm
    if iterations = 5                                     ; Perform 5 checks
        abort "!!! ABORTED !!! Failed to achieve < 0.002 deviation within 5 movements. Current deviation is " ^ move.calibration.initial.deviation ^ "mm."
    G30 P0 X5 Y110 Z-99999                                ; Probe near a leadscrew, half way along Y axis
    G30 P1 X215 Y110 Z-99999 S2                           ; Probe near a leadscrew and calibrate 2 motors
    G90                                                   ; Back to absolute mode

echo "Gantry deviation of " ^ move.calibration.initial.deviation ^ "mm obtained."


G90
G1 X87.5 Y105 F22800                                       ; Put head over the centre of the bed, or wherever you want to probe
G91
G1 Z10 F2600
G90
M400
G1 X0 Y0 F10000           ; Move to 0,0,10 at a safe speed
M400