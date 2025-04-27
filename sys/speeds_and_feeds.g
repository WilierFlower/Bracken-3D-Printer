;Speeds and Feeds

M201 X8000 Y8000 Z1500 E3000   ; set accelerations (mm/s^2)

M203 X22800.00 Y22800.00 Z2400.00 E7200 ; set maximum speeds (mm/min)

M204 P5000 T8000     ; Set printing and travel accelerations

M566 X900.00 Y900.00 Z500 E300 P1   ; set maximum instantaneous speed changes (mm/min)

M906 X1500 Y1500 Z400 E900 I2.5   ; set motor currents (mA) and motor idle factor in percent

M84 S30    ; Set idle timeout
