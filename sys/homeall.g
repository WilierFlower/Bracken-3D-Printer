; homeall.g
; Conditional Axis Homing and Filament-Specific Mesh Management

M561                         ; Clear any bed transform
M564 S1                      ; Don't allow manual moves outside limits
; Home X axis if not already homed
if !move.axes[0].homed
    M98 P"homex.g"

; Home Y axis if not already homed
if !move.axes[1].homed
    M98 P"homey.g"

; Home Z axis if not already homed
if !move.axes[2].homed
    M98 P"homez.g"

; Check for filament-specific height map
if move.extruders[0].filament != ""
    echo "Checking for filament-specific height map."
    G29 S1 P{"0:/filaments/" ^ move.extruders[0].filament ^ "/heightmap.csv"} ; Attempt to load height map
    if result > 1
        ; Popup for user choice: Generate new height map or skip
        M291 R"Height Map Missing" P"No Height Map Found For Current Filament. Would you like to generate a new height map?" K{"Generate New", "Skip"} S4
        if input == 0
            echo "Generating new height map."
            M703 ;load filament temps
            G32
            G29 ; Generate new mesh
            G29 S3 P{"0:/filaments/" ^ move.extruders[0].filament ^ "/heightmap.csv"} ; Save mesh
        elif input == 1
            echo "User chose to skip height map generation."
else
    ; Blocking message for no filament loaded
    M291 R"No Filament" P"No Filament Loaded. Height Map Not Applied." S3
    echo "No filament loaded. Skipping height map load."



