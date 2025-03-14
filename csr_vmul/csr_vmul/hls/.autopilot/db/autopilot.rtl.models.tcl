set SynModuleInfo {
  {SRCNAME csr_vmul MODELNAME csr_vmul RTLNAME csr_vmul IS_TOP 1
    SUBMODULES {
      {MODELNAME csr_vmul_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME csr_vmul_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME csr_vmul_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME csr_vmul_gmem_m_axi RTLNAME csr_vmul_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME csr_vmul_control_s_axi RTLNAME csr_vmul_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME csr_vmul_control_r_s_axi RTLNAME csr_vmul_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
