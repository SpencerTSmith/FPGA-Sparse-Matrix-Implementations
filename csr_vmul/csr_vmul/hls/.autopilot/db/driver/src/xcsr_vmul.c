// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xcsr_vmul.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCsr_vmul_CfgInitialize(XCsr_vmul *InstancePtr, XCsr_vmul_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Control_r_BaseAddress = ConfigPtr->Control_r_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCsr_vmul_Start(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCsr_vmul_IsDone(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCsr_vmul_IsIdle(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCsr_vmul_IsReady(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCsr_vmul_EnableAutoRestart(XCsr_vmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCsr_vmul_DisableAutoRestart(XCsr_vmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_AP_CTRL, 0);
}

void XCsr_vmul_Set_matrix_row_count(XCsr_vmul *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_ROW_COUNT_DATA, Data);
}

u32 XCsr_vmul_Get_matrix_row_count(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_ROW_COUNT_DATA);
    return Data;
}

void XCsr_vmul_Set_matrix_col_count(XCsr_vmul *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_COL_COUNT_DATA, Data);
}

u32 XCsr_vmul_Get_matrix_col_count(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_COL_COUNT_DATA);
    return Data;
}

void XCsr_vmul_Set_matrix_non_zero_count(XCsr_vmul *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_NON_ZERO_COUNT_DATA, Data);
}

u32 XCsr_vmul_Get_matrix_non_zero_count(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_MATRIX_NON_ZERO_COUNT_DATA);
    return Data;
}

void XCsr_vmul_Set_vector_count(XCsr_vmul *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_VECTOR_COUNT_DATA, Data);
}

u32 XCsr_vmul_Get_vector_count(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_VECTOR_COUNT_DATA);
    return Data;
}

void XCsr_vmul_Set_out_count(XCsr_vmul *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_OUT_COUNT_DATA, Data);
}

u32 XCsr_vmul_Get_out_count(XCsr_vmul *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_OUT_COUNT_DATA);
    return Data;
}

void XCsr_vmul_Set_matrix_row_pointers(XCsr_vmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA, (u32)(Data));
    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA + 4, (u32)(Data >> 32));
}

u64 XCsr_vmul_Get_matrix_row_pointers(XCsr_vmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA);
    Data += (u64)XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_ROW_POINTERS_DATA + 4) << 32;
    return Data;
}

void XCsr_vmul_Set_matrix_col_indices(XCsr_vmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA, (u32)(Data));
    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA + 4, (u32)(Data >> 32));
}

u64 XCsr_vmul_Get_matrix_col_indices(XCsr_vmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA);
    Data += (u64)XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_COL_INDICES_DATA + 4) << 32;
    return Data;
}

void XCsr_vmul_Set_matrix_values(XCsr_vmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_VALUES_DATA, (u32)(Data));
    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_VALUES_DATA + 4, (u32)(Data >> 32));
}

u64 XCsr_vmul_Get_matrix_values(XCsr_vmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_VALUES_DATA);
    Data += (u64)XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_MATRIX_VALUES_DATA + 4) << 32;
    return Data;
}

void XCsr_vmul_Set_vector_values(XCsr_vmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_VECTOR_VALUES_DATA, (u32)(Data));
    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_VECTOR_VALUES_DATA + 4, (u32)(Data >> 32));
}

u64 XCsr_vmul_Get_vector_values(XCsr_vmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_VECTOR_VALUES_DATA);
    Data += (u64)XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_VECTOR_VALUES_DATA + 4) << 32;
    return Data;
}

void XCsr_vmul_Set_out_values(XCsr_vmul *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_OUT_VALUES_DATA, (u32)(Data));
    XCsr_vmul_WriteReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_OUT_VALUES_DATA + 4, (u32)(Data >> 32));
}

u64 XCsr_vmul_Get_out_values(XCsr_vmul *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_OUT_VALUES_DATA);
    Data += (u64)XCsr_vmul_ReadReg(InstancePtr->Control_r_BaseAddress, XCSR_VMUL_CONTROL_R_ADDR_OUT_VALUES_DATA + 4) << 32;
    return Data;
}

void XCsr_vmul_InterruptGlobalEnable(XCsr_vmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_GIE, 1);
}

void XCsr_vmul_InterruptGlobalDisable(XCsr_vmul *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_GIE, 0);
}

void XCsr_vmul_InterruptEnable(XCsr_vmul *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_IER);
    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_IER, Register | Mask);
}

void XCsr_vmul_InterruptDisable(XCsr_vmul *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_IER);
    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCsr_vmul_InterruptClear(XCsr_vmul *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCsr_vmul_WriteReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_ISR, Mask);
}

u32 XCsr_vmul_InterruptGetEnabled(XCsr_vmul *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_IER);
}

u32 XCsr_vmul_InterruptGetStatus(XCsr_vmul *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCsr_vmul_ReadReg(InstancePtr->Control_BaseAddress, XCSR_VMUL_CONTROL_ADDR_ISR);
}

