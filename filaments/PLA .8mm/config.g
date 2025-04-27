; Filament: PLA Genaric .8mm
M140 S60                     ; Set bed temperature
G10 P0 R150 S190             ; Tool 0: Standby temperature 150°C, Active temperature 190°C
M109 S190                    ; Wait for nozzle to reach temperature

; Override global offsets for this filament
set global.hot_bed_offset = 0.05  ; Hot bed offset for this filament
set global.filament_offset = 0.01 ; Filament-specific offset
set global.nozzle_offset = 0.27   ; Nozzle size adjustment (optional)

; Brand-Specific Settings
M207 S1.2 F2100 Z0.5           ; Retraction settings
M572 D0 S0.28                 ; Pressure advance
M404 N1.75 D0.8              ; Set nozzle size

