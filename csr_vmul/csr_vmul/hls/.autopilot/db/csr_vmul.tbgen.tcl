set moduleName csr_vmul
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 7
set C_modelName {csr_vmul}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ BUNDLE_A int 32 regular {axi_master 0}  }
	{ BUNDLE_B int 32 regular {axi_master 0}  }
	{ BUNDLE_C int 32 regular {axi_master 0}  }
	{ BUNDLE_D int 32 regular {axi_master 0}  }
	{ gmem int 32 regular {axi_master 1}  }
	{ matrix_row_count int 32 regular {axi_slave 0}  }
	{ matrix_col_count int 32 unused {axi_slave 0}  }
	{ matrix_non_zero_count int 32 regular {axi_slave 0}  }
	{ matrix_row_pointers int 64 regular {axi_slave 0}  }
	{ matrix_col_indices int 64 regular {axi_slave 0}  }
	{ matrix_values int 64 regular {axi_slave 0}  }
	{ vector_values int 64 regular {axi_slave 0}  }
	{ vector_count int 32 regular {axi_slave 0}  }
	{ out_values int 64 regular {axi_slave 0}  }
	{ out_count int 32 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "BUNDLE_A", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "matrix_row_pointers","offset": { "type": "dynamic","port_name": "matrix_row_pointers","bundle": "control_r"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUNDLE_B", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "matrix_col_indices","offset": { "type": "dynamic","port_name": "matrix_col_indices","bundle": "control_r"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUNDLE_C", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "matrix_values","offset": { "type": "dynamic","port_name": "matrix_values","bundle": "control_r"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "BUNDLE_D", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "vector_values","offset": { "type": "dynamic","port_name": "vector_values","bundle": "control_r"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "out_values","offset": { "type": "dynamic","port_name": "out_values","bundle": "control_r"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "matrix_row_count", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "matrix_col_count", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "matrix_non_zero_count", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "matrix_row_pointers", "interface" : "axi_slave", "bundle":"control_r","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "matrix_col_indices", "interface" : "axi_slave", "bundle":"control_r","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "matrix_values", "interface" : "axi_slave", "bundle":"control_r","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "vector_values", "interface" : "axi_slave", "bundle":"control_r","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} , 
 	{ "Name" : "vector_count", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "out_values", "interface" : "axi_slave", "bundle":"control_r","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":75}} , 
 	{ "Name" : "out_count", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":48}, "offset_end" : {"out":55}} ]}
# RTL Port declarations: 
set portNum 262
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_BUNDLE_A_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUNDLE_A_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUNDLE_A_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUNDLE_A_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUNDLE_A_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_BUNDLE_A_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_BUNDLE_A_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_BUNDLE_A_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUNDLE_A_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_BUNDLE_A_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_BUNDLE_A_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_BUNDLE_A_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_BUNDLE_A_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_BUNDLE_A_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_A_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_BUNDLE_B_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUNDLE_B_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUNDLE_B_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUNDLE_B_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUNDLE_B_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_BUNDLE_B_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_BUNDLE_B_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_BUNDLE_B_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUNDLE_B_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_BUNDLE_B_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_BUNDLE_B_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_BUNDLE_B_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_BUNDLE_B_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_BUNDLE_B_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_B_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_BUNDLE_C_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_BUNDLE_C_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_BUNDLE_C_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_BUNDLE_C_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_BUNDLE_C_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_BUNDLE_C_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_BUNDLE_C_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_BUNDLE_C_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_BUNDLE_C_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_BUNDLE_C_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_BUNDLE_C_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_BUNDLE_C_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_BUNDLE_C_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_BUNDLE_C_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_C_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_BUNDLE_D_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_BUNDLE_D_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_AWLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_BUNDLE_D_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_BUNDLE_D_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_BUNDLE_D_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_WDATA sc_out sc_lv 32 signal 3 } 
	{ m_axi_BUNDLE_D_WSTRB sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_BUNDLE_D_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_ARLEN sc_out sc_lv 8 signal 3 } 
	{ m_axi_BUNDLE_D_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_BUNDLE_D_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_BUNDLE_D_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_BUNDLE_D_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_RDATA sc_in sc_lv 32 signal 3 } 
	{ m_axi_BUNDLE_D_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_BUNDLE_D_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_BUNDLE_D_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_BUNDLE_D_BUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 8 signal 4 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 32 signal 4 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 8 signal 4 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 32 signal 4 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 4 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_r_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_r_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_r_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_r_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_r_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_r_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_r_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_r_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_r_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_r_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_r_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_r_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"csr_vmul","role":"start","value":"0","valid_bit":"0"},{"name":"csr_vmul","role":"continue","value":"0","valid_bit":"4"},{"name":"csr_vmul","role":"auto_start","value":"0","valid_bit":"7"},{"name":"matrix_row_count","role":"data","value":"16"},{"name":"matrix_col_count","role":"data","value":"24"},{"name":"matrix_non_zero_count","role":"data","value":"32"},{"name":"vector_count","role":"data","value":"40"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"csr_vmul","role":"start","value":"0","valid_bit":"0"},{"name":"csr_vmul","role":"done","value":"0","valid_bit":"1"},{"name":"csr_vmul","role":"idle","value":"0","valid_bit":"2"},{"name":"csr_vmul","role":"ready","value":"0","valid_bit":"3"},{"name":"csr_vmul","role":"auto_start","value":"0","valid_bit":"7"},{"name":"out_count","role":"data","value":"48"}, {"name":"out_count","role":"valid","value":"52","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } },
	{ "name": "s_axi_control_r_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control_r", "role": "AWADDR" },"address":[{"name":"matrix_row_pointers","role":"data","value":"16"},{"name":"matrix_col_indices","role":"data","value":"28"},{"name":"matrix_values","role":"data","value":"40"},{"name":"vector_values","role":"data","value":"52"},{"name":"out_values","role":"data","value":"64"}] },
	{ "name": "s_axi_control_r_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "AWVALID" } },
	{ "name": "s_axi_control_r_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "AWREADY" } },
	{ "name": "s_axi_control_r_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "WVALID" } },
	{ "name": "s_axi_control_r_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "WREADY" } },
	{ "name": "s_axi_control_r_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control_r", "role": "WDATA" } },
	{ "name": "s_axi_control_r_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control_r", "role": "WSTRB" } },
	{ "name": "s_axi_control_r_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control_r", "role": "ARADDR" },"address":[] },
	{ "name": "s_axi_control_r_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "ARVALID" } },
	{ "name": "s_axi_control_r_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "ARREADY" } },
	{ "name": "s_axi_control_r_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "RVALID" } },
	{ "name": "s_axi_control_r_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "RREADY" } },
	{ "name": "s_axi_control_r_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control_r", "role": "RDATA" } },
	{ "name": "s_axi_control_r_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control_r", "role": "RRESP" } },
	{ "name": "s_axi_control_r_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "BVALID" } },
	{ "name": "s_axi_control_r_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_r", "role": "BREADY" } },
	{ "name": "s_axi_control_r_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control_r", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWID" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUNDLE_A_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUNDLE_A_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUNDLE_A_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUNDLE_A_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUNDLE_A_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUNDLE_A_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUNDLE_A_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WID" }} , 
 	{ "name": "m_axi_BUNDLE_A_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARID" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUNDLE_A_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUNDLE_A_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUNDLE_A_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUNDLE_A_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUNDLE_A_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUNDLE_A_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RID" }} , 
 	{ "name": "m_axi_BUNDLE_A_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUNDLE_A_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUNDLE_A_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUNDLE_A_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUNDLE_A_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUNDLE_A_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "BID" }} , 
 	{ "name": "m_axi_BUNDLE_A_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_A", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWID" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUNDLE_B_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUNDLE_B_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUNDLE_B_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUNDLE_B_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUNDLE_B_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUNDLE_B_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUNDLE_B_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WID" }} , 
 	{ "name": "m_axi_BUNDLE_B_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARID" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUNDLE_B_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUNDLE_B_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUNDLE_B_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUNDLE_B_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUNDLE_B_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUNDLE_B_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RID" }} , 
 	{ "name": "m_axi_BUNDLE_B_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUNDLE_B_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUNDLE_B_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUNDLE_B_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUNDLE_B_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUNDLE_B_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "BID" }} , 
 	{ "name": "m_axi_BUNDLE_B_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_B", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWID" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUNDLE_C_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUNDLE_C_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUNDLE_C_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUNDLE_C_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUNDLE_C_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUNDLE_C_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUNDLE_C_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WID" }} , 
 	{ "name": "m_axi_BUNDLE_C_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARID" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUNDLE_C_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUNDLE_C_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUNDLE_C_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUNDLE_C_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUNDLE_C_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUNDLE_C_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RID" }} , 
 	{ "name": "m_axi_BUNDLE_C_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUNDLE_C_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUNDLE_C_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUNDLE_C_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUNDLE_C_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUNDLE_C_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "BID" }} , 
 	{ "name": "m_axi_BUNDLE_C_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_C", "role": "BUSER" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWVALID" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWREADY" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWADDR" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWID" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWLEN" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWBURST" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWPROT" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWQOS" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWREGION" }} , 
 	{ "name": "m_axi_BUNDLE_D_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "AWUSER" }} , 
 	{ "name": "m_axi_BUNDLE_D_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WVALID" }} , 
 	{ "name": "m_axi_BUNDLE_D_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WREADY" }} , 
 	{ "name": "m_axi_BUNDLE_D_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WDATA" }} , 
 	{ "name": "m_axi_BUNDLE_D_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WSTRB" }} , 
 	{ "name": "m_axi_BUNDLE_D_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WLAST" }} , 
 	{ "name": "m_axi_BUNDLE_D_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WID" }} , 
 	{ "name": "m_axi_BUNDLE_D_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "WUSER" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARVALID" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARREADY" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARADDR" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARID" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARLEN" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARBURST" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARPROT" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARQOS" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARREGION" }} , 
 	{ "name": "m_axi_BUNDLE_D_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "ARUSER" }} , 
 	{ "name": "m_axi_BUNDLE_D_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RVALID" }} , 
 	{ "name": "m_axi_BUNDLE_D_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RREADY" }} , 
 	{ "name": "m_axi_BUNDLE_D_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RDATA" }} , 
 	{ "name": "m_axi_BUNDLE_D_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RLAST" }} , 
 	{ "name": "m_axi_BUNDLE_D_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RID" }} , 
 	{ "name": "m_axi_BUNDLE_D_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RUSER" }} , 
 	{ "name": "m_axi_BUNDLE_D_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "RRESP" }} , 
 	{ "name": "m_axi_BUNDLE_D_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "BVALID" }} , 
 	{ "name": "m_axi_BUNDLE_D_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "BREADY" }} , 
 	{ "name": "m_axi_BUNDLE_D_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "BRESP" }} , 
 	{ "name": "m_axi_BUNDLE_D_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "BID" }} , 
 	{ "name": "m_axi_BUNDLE_D_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "BUNDLE_D", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7", "9", "11", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
		"CDFG" : "csr_vmul",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "97612819",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUNDLE_A", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_A_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_csr_vmul_Pipeline_load_row_pointers_fu_1590", "Port" : "BUNDLE_A", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BUNDLE_B", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_B_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_csr_vmul_Pipeline_load_col_indices_fu_1581", "Port" : "BUNDLE_B", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BUNDLE_C", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_C_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_csr_vmul_Pipeline_load_matrix_values_fu_1599", "Port" : "BUNDLE_C", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BUNDLE_D", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_D_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_csr_vmul_Pipeline_load_vector_fu_1572", "Port" : "BUNDLE_D", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "matrix_row_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "matrix_col_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "matrix_non_zero_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "matrix_row_pointers", "Type" : "None", "Direction" : "I"},
			{"Name" : "matrix_col_indices", "Type" : "None", "Direction" : "I"},
			{"Name" : "matrix_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "vector_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "vector_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_count", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "unroll_partial", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "200", "FirstState" : "ap_ST_fsm_state15", "LastState" : ["ap_ST_fsm_state107"], "QuitState" : ["ap_ST_fsm_state15"], "PreState" : ["ap_ST_fsm_state14"], "PostState" : ["ap_ST_fsm_state108"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "every_row", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "200", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state195"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state196"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_vector_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_col_indices_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_row_pointers_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_matrix_values_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_vector_fu_1572", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "csr_vmul_Pipeline_load_vector",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUNDLE_D", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_D_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "vector_count_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln48", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_vector", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "load_vector", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_vector_fu_1572.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_col_indices_fu_1581", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "csr_vmul_Pipeline_load_col_indices",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUNDLE_B", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_B_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "matrix_non_zero_count_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln56", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_col_indices", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "load_col_indices", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_col_indices_fu_1581.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_row_pointers_fu_1590", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "csr_vmul_Pipeline_load_row_pointers",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUNDLE_A", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_A_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "add", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln64", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_row_pointers", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "load_row_pointers", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_row_pointers_fu_1590.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_matrix_values_fu_1599", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "csr_vmul_Pipeline_load_matrix_values",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "1027",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BUNDLE_C", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "BUNDLE_C_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "matrix_non_zero_count_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln72", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_matrix_values", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "load_matrix_values", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_csr_vmul_Pipeline_load_matrix_values_fu_1599.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_r_s_axi_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUNDLE_A_m_axi_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUNDLE_B_m_axi_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUNDLE_C_m_axi_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BUNDLE_D_m_axi_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_m_axi_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U17", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U18", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	csr_vmul {
		BUNDLE_A {Type I LastRead 1 FirstWrite -1}
		BUNDLE_B {Type I LastRead 1 FirstWrite -1}
		BUNDLE_C {Type I LastRead 1 FirstWrite -1}
		BUNDLE_D {Type I LastRead 1 FirstWrite -1}
		gmem {Type O LastRead 12 FirstWrite 102}
		matrix_row_count {Type I LastRead 0 FirstWrite -1}
		matrix_col_count {Type I LastRead -1 FirstWrite -1}
		matrix_non_zero_count {Type I LastRead 0 FirstWrite -1}
		matrix_row_pointers {Type I LastRead 0 FirstWrite -1}
		matrix_col_indices {Type I LastRead 0 FirstWrite -1}
		matrix_values {Type I LastRead 0 FirstWrite -1}
		vector_values {Type I LastRead 0 FirstWrite -1}
		vector_count {Type I LastRead 0 FirstWrite -1}
		out_values {Type I LastRead 0 FirstWrite -1}
		out_count {Type O LastRead -1 FirstWrite 0}}
	csr_vmul_Pipeline_load_vector {
		BUNDLE_D {Type I LastRead 1 FirstWrite -1}
		vector_count_load {Type I LastRead 0 FirstWrite -1}
		sext_ln48 {Type I LastRead 0 FirstWrite -1}
		local_vector {Type O LastRead -1 FirstWrite 2}}
	csr_vmul_Pipeline_load_col_indices {
		BUNDLE_B {Type I LastRead 1 FirstWrite -1}
		matrix_non_zero_count_load {Type I LastRead 0 FirstWrite -1}
		sext_ln56 {Type I LastRead 0 FirstWrite -1}
		local_col_indices {Type O LastRead -1 FirstWrite 2}}
	csr_vmul_Pipeline_load_row_pointers {
		BUNDLE_A {Type I LastRead 1 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}
		sext_ln64 {Type I LastRead 0 FirstWrite -1}
		local_row_pointers {Type O LastRead -1 FirstWrite 2}}
	csr_vmul_Pipeline_load_matrix_values {
		BUNDLE_C {Type I LastRead 1 FirstWrite -1}
		matrix_non_zero_count_load {Type I LastRead 0 FirstWrite -1}
		sext_ln72 {Type I LastRead 0 FirstWrite -1}
		local_matrix_values {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "18", "Max" : "97612819"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "97612820"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BUNDLE_A { m_axi {  { m_axi_BUNDLE_A_AWVALID VALID 1 1 }  { m_axi_BUNDLE_A_AWREADY READY 0 1 }  { m_axi_BUNDLE_A_AWADDR ADDR 1 64 }  { m_axi_BUNDLE_A_AWID ID 1 1 }  { m_axi_BUNDLE_A_AWLEN SIZE 1 8 }  { m_axi_BUNDLE_A_AWSIZE BURST 1 3 }  { m_axi_BUNDLE_A_AWBURST LOCK 1 2 }  { m_axi_BUNDLE_A_AWLOCK CACHE 1 2 }  { m_axi_BUNDLE_A_AWCACHE PROT 1 4 }  { m_axi_BUNDLE_A_AWPROT QOS 1 3 }  { m_axi_BUNDLE_A_AWQOS REGION 1 4 }  { m_axi_BUNDLE_A_AWREGION USER 1 4 }  { m_axi_BUNDLE_A_AWUSER DATA 1 1 }  { m_axi_BUNDLE_A_WVALID VALID 1 1 }  { m_axi_BUNDLE_A_WREADY READY 0 1 }  { m_axi_BUNDLE_A_WDATA FIFONUM 1 32 }  { m_axi_BUNDLE_A_WSTRB STRB 1 4 }  { m_axi_BUNDLE_A_WLAST LAST 1 1 }  { m_axi_BUNDLE_A_WID ID 1 1 }  { m_axi_BUNDLE_A_WUSER DATA 1 1 }  { m_axi_BUNDLE_A_ARVALID VALID 1 1 }  { m_axi_BUNDLE_A_ARREADY READY 0 1 }  { m_axi_BUNDLE_A_ARADDR ADDR 1 64 }  { m_axi_BUNDLE_A_ARID ID 1 1 }  { m_axi_BUNDLE_A_ARLEN SIZE 1 8 }  { m_axi_BUNDLE_A_ARSIZE BURST 1 3 }  { m_axi_BUNDLE_A_ARBURST LOCK 1 2 }  { m_axi_BUNDLE_A_ARLOCK CACHE 1 2 }  { m_axi_BUNDLE_A_ARCACHE PROT 1 4 }  { m_axi_BUNDLE_A_ARPROT QOS 1 3 }  { m_axi_BUNDLE_A_ARQOS REGION 1 4 }  { m_axi_BUNDLE_A_ARREGION USER 1 4 }  { m_axi_BUNDLE_A_ARUSER DATA 1 1 }  { m_axi_BUNDLE_A_RVALID VALID 0 1 }  { m_axi_BUNDLE_A_RREADY READY 1 1 }  { m_axi_BUNDLE_A_RDATA FIFONUM 0 32 }  { m_axi_BUNDLE_A_RLAST LAST 0 1 }  { m_axi_BUNDLE_A_RID ID 0 1 }  { m_axi_BUNDLE_A_RUSER DATA 0 1 }  { m_axi_BUNDLE_A_RRESP RESP 0 2 }  { m_axi_BUNDLE_A_BVALID VALID 0 1 }  { m_axi_BUNDLE_A_BREADY READY 1 1 }  { m_axi_BUNDLE_A_BRESP RESP 0 2 }  { m_axi_BUNDLE_A_BID ID 0 1 }  { m_axi_BUNDLE_A_BUSER DATA 0 1 } } }
	BUNDLE_B { m_axi {  { m_axi_BUNDLE_B_AWVALID VALID 1 1 }  { m_axi_BUNDLE_B_AWREADY READY 0 1 }  { m_axi_BUNDLE_B_AWADDR ADDR 1 64 }  { m_axi_BUNDLE_B_AWID ID 1 1 }  { m_axi_BUNDLE_B_AWLEN SIZE 1 8 }  { m_axi_BUNDLE_B_AWSIZE BURST 1 3 }  { m_axi_BUNDLE_B_AWBURST LOCK 1 2 }  { m_axi_BUNDLE_B_AWLOCK CACHE 1 2 }  { m_axi_BUNDLE_B_AWCACHE PROT 1 4 }  { m_axi_BUNDLE_B_AWPROT QOS 1 3 }  { m_axi_BUNDLE_B_AWQOS REGION 1 4 }  { m_axi_BUNDLE_B_AWREGION USER 1 4 }  { m_axi_BUNDLE_B_AWUSER DATA 1 1 }  { m_axi_BUNDLE_B_WVALID VALID 1 1 }  { m_axi_BUNDLE_B_WREADY READY 0 1 }  { m_axi_BUNDLE_B_WDATA FIFONUM 1 32 }  { m_axi_BUNDLE_B_WSTRB STRB 1 4 }  { m_axi_BUNDLE_B_WLAST LAST 1 1 }  { m_axi_BUNDLE_B_WID ID 1 1 }  { m_axi_BUNDLE_B_WUSER DATA 1 1 }  { m_axi_BUNDLE_B_ARVALID VALID 1 1 }  { m_axi_BUNDLE_B_ARREADY READY 0 1 }  { m_axi_BUNDLE_B_ARADDR ADDR 1 64 }  { m_axi_BUNDLE_B_ARID ID 1 1 }  { m_axi_BUNDLE_B_ARLEN SIZE 1 8 }  { m_axi_BUNDLE_B_ARSIZE BURST 1 3 }  { m_axi_BUNDLE_B_ARBURST LOCK 1 2 }  { m_axi_BUNDLE_B_ARLOCK CACHE 1 2 }  { m_axi_BUNDLE_B_ARCACHE PROT 1 4 }  { m_axi_BUNDLE_B_ARPROT QOS 1 3 }  { m_axi_BUNDLE_B_ARQOS REGION 1 4 }  { m_axi_BUNDLE_B_ARREGION USER 1 4 }  { m_axi_BUNDLE_B_ARUSER DATA 1 1 }  { m_axi_BUNDLE_B_RVALID VALID 0 1 }  { m_axi_BUNDLE_B_RREADY READY 1 1 }  { m_axi_BUNDLE_B_RDATA FIFONUM 0 32 }  { m_axi_BUNDLE_B_RLAST LAST 0 1 }  { m_axi_BUNDLE_B_RID ID 0 1 }  { m_axi_BUNDLE_B_RUSER DATA 0 1 }  { m_axi_BUNDLE_B_RRESP RESP 0 2 }  { m_axi_BUNDLE_B_BVALID VALID 0 1 }  { m_axi_BUNDLE_B_BREADY READY 1 1 }  { m_axi_BUNDLE_B_BRESP RESP 0 2 }  { m_axi_BUNDLE_B_BID ID 0 1 }  { m_axi_BUNDLE_B_BUSER DATA 0 1 } } }
	BUNDLE_C { m_axi {  { m_axi_BUNDLE_C_AWVALID VALID 1 1 }  { m_axi_BUNDLE_C_AWREADY READY 0 1 }  { m_axi_BUNDLE_C_AWADDR ADDR 1 64 }  { m_axi_BUNDLE_C_AWID ID 1 1 }  { m_axi_BUNDLE_C_AWLEN SIZE 1 8 }  { m_axi_BUNDLE_C_AWSIZE BURST 1 3 }  { m_axi_BUNDLE_C_AWBURST LOCK 1 2 }  { m_axi_BUNDLE_C_AWLOCK CACHE 1 2 }  { m_axi_BUNDLE_C_AWCACHE PROT 1 4 }  { m_axi_BUNDLE_C_AWPROT QOS 1 3 }  { m_axi_BUNDLE_C_AWQOS REGION 1 4 }  { m_axi_BUNDLE_C_AWREGION USER 1 4 }  { m_axi_BUNDLE_C_AWUSER DATA 1 1 }  { m_axi_BUNDLE_C_WVALID VALID 1 1 }  { m_axi_BUNDLE_C_WREADY READY 0 1 }  { m_axi_BUNDLE_C_WDATA FIFONUM 1 32 }  { m_axi_BUNDLE_C_WSTRB STRB 1 4 }  { m_axi_BUNDLE_C_WLAST LAST 1 1 }  { m_axi_BUNDLE_C_WID ID 1 1 }  { m_axi_BUNDLE_C_WUSER DATA 1 1 }  { m_axi_BUNDLE_C_ARVALID VALID 1 1 }  { m_axi_BUNDLE_C_ARREADY READY 0 1 }  { m_axi_BUNDLE_C_ARADDR ADDR 1 64 }  { m_axi_BUNDLE_C_ARID ID 1 1 }  { m_axi_BUNDLE_C_ARLEN SIZE 1 8 }  { m_axi_BUNDLE_C_ARSIZE BURST 1 3 }  { m_axi_BUNDLE_C_ARBURST LOCK 1 2 }  { m_axi_BUNDLE_C_ARLOCK CACHE 1 2 }  { m_axi_BUNDLE_C_ARCACHE PROT 1 4 }  { m_axi_BUNDLE_C_ARPROT QOS 1 3 }  { m_axi_BUNDLE_C_ARQOS REGION 1 4 }  { m_axi_BUNDLE_C_ARREGION USER 1 4 }  { m_axi_BUNDLE_C_ARUSER DATA 1 1 }  { m_axi_BUNDLE_C_RVALID VALID 0 1 }  { m_axi_BUNDLE_C_RREADY READY 1 1 }  { m_axi_BUNDLE_C_RDATA FIFONUM 0 32 }  { m_axi_BUNDLE_C_RLAST LAST 0 1 }  { m_axi_BUNDLE_C_RID ID 0 1 }  { m_axi_BUNDLE_C_RUSER DATA 0 1 }  { m_axi_BUNDLE_C_RRESP RESP 0 2 }  { m_axi_BUNDLE_C_BVALID VALID 0 1 }  { m_axi_BUNDLE_C_BREADY READY 1 1 }  { m_axi_BUNDLE_C_BRESP RESP 0 2 }  { m_axi_BUNDLE_C_BID ID 0 1 }  { m_axi_BUNDLE_C_BUSER DATA 0 1 } } }
	BUNDLE_D { m_axi {  { m_axi_BUNDLE_D_AWVALID VALID 1 1 }  { m_axi_BUNDLE_D_AWREADY READY 0 1 }  { m_axi_BUNDLE_D_AWADDR ADDR 1 64 }  { m_axi_BUNDLE_D_AWID ID 1 1 }  { m_axi_BUNDLE_D_AWLEN SIZE 1 8 }  { m_axi_BUNDLE_D_AWSIZE BURST 1 3 }  { m_axi_BUNDLE_D_AWBURST LOCK 1 2 }  { m_axi_BUNDLE_D_AWLOCK CACHE 1 2 }  { m_axi_BUNDLE_D_AWCACHE PROT 1 4 }  { m_axi_BUNDLE_D_AWPROT QOS 1 3 }  { m_axi_BUNDLE_D_AWQOS REGION 1 4 }  { m_axi_BUNDLE_D_AWREGION USER 1 4 }  { m_axi_BUNDLE_D_AWUSER DATA 1 1 }  { m_axi_BUNDLE_D_WVALID VALID 1 1 }  { m_axi_BUNDLE_D_WREADY READY 0 1 }  { m_axi_BUNDLE_D_WDATA FIFONUM 1 32 }  { m_axi_BUNDLE_D_WSTRB STRB 1 4 }  { m_axi_BUNDLE_D_WLAST LAST 1 1 }  { m_axi_BUNDLE_D_WID ID 1 1 }  { m_axi_BUNDLE_D_WUSER DATA 1 1 }  { m_axi_BUNDLE_D_ARVALID VALID 1 1 }  { m_axi_BUNDLE_D_ARREADY READY 0 1 }  { m_axi_BUNDLE_D_ARADDR ADDR 1 64 }  { m_axi_BUNDLE_D_ARID ID 1 1 }  { m_axi_BUNDLE_D_ARLEN SIZE 1 8 }  { m_axi_BUNDLE_D_ARSIZE BURST 1 3 }  { m_axi_BUNDLE_D_ARBURST LOCK 1 2 }  { m_axi_BUNDLE_D_ARLOCK CACHE 1 2 }  { m_axi_BUNDLE_D_ARCACHE PROT 1 4 }  { m_axi_BUNDLE_D_ARPROT QOS 1 3 }  { m_axi_BUNDLE_D_ARQOS REGION 1 4 }  { m_axi_BUNDLE_D_ARREGION USER 1 4 }  { m_axi_BUNDLE_D_ARUSER DATA 1 1 }  { m_axi_BUNDLE_D_RVALID VALID 0 1 }  { m_axi_BUNDLE_D_RREADY READY 1 1 }  { m_axi_BUNDLE_D_RDATA FIFONUM 0 32 }  { m_axi_BUNDLE_D_RLAST LAST 0 1 }  { m_axi_BUNDLE_D_RID ID 0 1 }  { m_axi_BUNDLE_D_RUSER DATA 0 1 }  { m_axi_BUNDLE_D_RRESP RESP 0 2 }  { m_axi_BUNDLE_D_BVALID VALID 0 1 }  { m_axi_BUNDLE_D_BREADY READY 1 1 }  { m_axi_BUNDLE_D_BRESP RESP 0 2 }  { m_axi_BUNDLE_D_BID ID 0 1 }  { m_axi_BUNDLE_D_BUSER DATA 0 1 } } }
	gmem { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 8 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 32 }  { m_axi_gmem_WSTRB STRB 1 4 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 8 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 32 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict BUNDLE_A { CHANNEL_NUM 0 BUNDLE BUNDLE_A NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUNDLE_B { CHANNEL_NUM 0 BUNDLE BUNDLE_B NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUNDLE_C { CHANNEL_NUM 0 BUNDLE BUNDLE_C NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict BUNDLE_D { CHANNEL_NUM 0 BUNDLE BUNDLE_D NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem { CHANNEL_NUM 0 BUNDLE gmem NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ BUNDLE_A 1 }
	{ BUNDLE_B 1 }
	{ BUNDLE_C 1 }
	{ BUNDLE_D 1 }
	{ gmem 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ BUNDLE_A 1 }
	{ BUNDLE_B 1 }
	{ BUNDLE_C 1 }
	{ BUNDLE_D 1 }
	{ gmem 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
