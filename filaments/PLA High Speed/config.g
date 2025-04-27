; Filament: PLA Genaric .4mm
M140 S60                     ; Set bed temperature
G10 P0 R150 S190             ; Tool 0: Standby temperature 150°C, Active temperature 190°C
M109 S190                    ; Wait for nozzle to reach temperature

; Offsets
if !exists(global.hot_bed_offset)
    global hot_bed_offset = 0.05    ; Hot bed offset for this filament
if !exists(global.filament_offset)
    global filament_offset = 0.01   ; Filament-specific offset
if !exists(global.nozzle_offset)
    global nozzle_offset = 0.27     ; Nozzle size adjustment (optional)

; Brand-Specific Settings
M207 S1.5 F7200 Z0.2           ; Retraction settings
M572 D0 S0.2                   ; Pressure advance
M404 N1.75 D0.4                ; Set nozzle size (e.g., 0.4mm)

