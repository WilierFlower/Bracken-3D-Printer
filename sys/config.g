; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up

; General preferences
G90                                                    ; send absolute coordinates...
G21                                                    ; work in mm
M83                                                    ; ...but relative extruder moves
M550 P"AM8"                                            ; set printer name
M669 K0                                                ; kinematics type

M81 C"pson"                                            ; allocate the PS_ON pin to power control but leave power off



M98 P"network.g"
M98 P"drives.g"
M98 P"speeds_and_feeds.g"
M98 P"axis_limits.g"
M98 P"endstops.g"
M98 P"heaters.g"
M98 P"fans.g"
M98 P"leds.g"
M98 P"tools.g"
M98 P"z_probe.g"
M98 P"miscellaneous.g"
