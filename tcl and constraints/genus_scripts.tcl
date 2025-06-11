set_db lib_search_path /home/installs/FOUNDRY/digital/90nm/dig/lib/

set_db library slow.lib

set_db hdl_search_path ./

read_hdl design.v

elaborate module_name

read_sdc constraints.sdc
synthesize -to_mapped -effort medium



write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  > ./out/delays.sdf

write_hdl > ./out/counter_netlist.v

write_sdc> ./results/counter_sdc.sdc 


gui_show

report timing > ./out/counter_timing.rep

report power > ./out/counter_power.rep

report area > ./out/counter_cell.rep

report messages > ./out/counter_message.rep
