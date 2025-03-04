# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
matrix_row_count { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
matrix_col_count { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
matrix_non_zero_count { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
vector_count { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
out_count { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


set port_control_r {
matrix_row_pointers { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
matrix_col_indices { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
matrix_values { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
vector_values { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
out_values { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
}
dict set axilite_register_dict control_r $port_control_r


