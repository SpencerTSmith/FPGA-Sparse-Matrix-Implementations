set SynModuleInfo {
  {SRCNAME csr_vmul_Pipeline_load_vector MODELNAME csr_vmul_Pipeline_load_vector RTLNAME csr_vmul_csr_vmul_Pipeline_load_vector
    SUBMODULES {
      {MODELNAME csr_vmul_flow_control_loop_pipe_sequential_init RTLNAME csr_vmul_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME csr_vmul_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME csr_vmul_Pipeline_load_col_indices MODELNAME csr_vmul_Pipeline_load_col_indices RTLNAME csr_vmul_csr_vmul_Pipeline_load_col_indices}
  {SRCNAME csr_vmul_Pipeline_load_row_pointers MODELNAME csr_vmul_Pipeline_load_row_pointers RTLNAME csr_vmul_csr_vmul_Pipeline_load_row_pointers}
  {SRCNAME csr_vmul_Pipeline_load_matrix_values MODELNAME csr_vmul_Pipeline_load_matrix_values RTLNAME csr_vmul_csr_vmul_Pipeline_load_matrix_values}
  {SRCNAME csr_vmul MODELNAME csr_vmul RTLNAME csr_vmul IS_TOP 1
    SUBMODULES {
      {MODELNAME csr_vmul_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME csr_vmul_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME csr_vmul_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_local_vector_RAM_1WNR_AUTO_1R1W RTLNAME csr_vmul_local_vector_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_local_col_indices_RAM_1WNR_AUTO_1R1W RTLNAME csr_vmul_local_col_indices_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_local_row_pointers_RAM_AUTO_1R1W RTLNAME csr_vmul_local_row_pointers_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_BUNDLE_A_m_axi RTLNAME csr_vmul_BUNDLE_A_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_BUNDLE_B_m_axi RTLNAME csr_vmul_BUNDLE_B_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_BUNDLE_C_m_axi RTLNAME csr_vmul_BUNDLE_C_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_BUNDLE_D_m_axi RTLNAME csr_vmul_BUNDLE_D_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_gmem_m_axi RTLNAME csr_vmul_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_control_s_axi RTLNAME csr_vmul_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME csr_vmul_control_r_s_axi RTLNAME csr_vmul_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
