; Filament: PETG Genaric .4mm
M140 S80                     ; Set bed temperature
G10 P0 R180 S210             ; Tool 0: Standby temperature 150°C, Active temperature 190°C
M109 S210                    ; Wait for nozzle to reach temperature


; Brand-Specific Settings
M207 S0.5 F2100 Z0.2           ; Retraction settings
M572 D0 S0.02                 ; Pressure advance
M404 N1.75 D0.4               ; Set nozzle size (e.g., 0.4mm)
