create_clock -name clk -period 2.0 -waveform {0 1} [get_ports "clk"]

set_clock_transition -rise 0.1 [get_clocks "clk"]

set_clock_transition -fall 0.1 [get_clocks "clk"]

set_clock_uncertainty 0.01 [get_ports "clk"]

set_input_delay -max 0.5[get_ports "rst"] -clock [get_clocks "clk"] 

set_output_delay -max 0.5 [get_ports "count"] -clock [get_clocks "clk"]

