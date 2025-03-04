// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XCSR_VMUL_H
#define XCSR_VMUL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcsr_vmul_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
} XCsr_vmul_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
    u32 IsReady;
} XCsr_vmul;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCsr_vmul_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCsr_vmul_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCsr_vmul_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCsr_vmul_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XCsr_vmul_Initialize(XCsr_vmul *InstancePtr, UINTPTR BaseAddress);
XCsr_vmul_Config* XCsr_vmul_LookupConfig(UINTPTR BaseAddress);
#else
int XCsr_vmul_Initialize(XCsr_vmul *InstancePtr, u16 DeviceId);
XCsr_vmul_Config* XCsr_vmul_LookupConfig(u16 DeviceId);
#endif
int XCsr_vmul_CfgInitialize(XCsr_vmul *InstancePtr, XCsr_vmul_Config *ConfigPtr);
#else
int XCsr_vmul_Initialize(XCsr_vmul *InstancePtr, const char* InstanceName);
int XCsr_vmul_Release(XCsr_vmul *InstancePtr);
#endif

void XCsr_vmul_Start(XCsr_vmul *InstancePtr);
u32 XCsr_vmul_IsDone(XCsr_vmul *InstancePtr);
u32 XCsr_vmul_IsIdle(XCsr_vmul *InstancePtr);
u32 XCsr_vmul_IsReady(XCsr_vmul *InstancePtr);
void XCsr_vmul_EnableAutoRestart(XCsr_vmul *InstancePtr);
void XCsr_vmul_DisableAutoRestart(XCsr_vmul *InstancePtr);

void XCsr_vmul_Set_matrix_row_count(XCsr_vmul *InstancePtr, u32 Data);
u32 XCsr_vmul_Get_matrix_row_count(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_matrix_col_count(XCsr_vmul *InstancePtr, u32 Data);
u32 XCsr_vmul_Get_matrix_col_count(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_matrix_non_zero_count(XCsr_vmul *InstancePtr, u32 Data);
u32 XCsr_vmul_Get_matrix_non_zero_count(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_vector_count(XCsr_vmul *InstancePtr, u32 Data);
u32 XCsr_vmul_Get_vector_count(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_out_count(XCsr_vmul *InstancePtr, u32 Data);
u32 XCsr_vmul_Get_out_count(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_matrix_row_pointers(XCsr_vmul *InstancePtr, u64 Data);
u64 XCsr_vmul_Get_matrix_row_pointers(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_matrix_col_indices(XCsr_vmul *InstancePtr, u64 Data);
u64 XCsr_vmul_Get_matrix_col_indices(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_matrix_values(XCsr_vmul *InstancePtr, u64 Data);
u64 XCsr_vmul_Get_matrix_values(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_vector_values(XCsr_vmul *InstancePtr, u64 Data);
u64 XCsr_vmul_Get_vector_values(XCsr_vmul *InstancePtr);
void XCsr_vmul_Set_out_values(XCsr_vmul *InstancePtr, u64 Data);
u64 XCsr_vmul_Get_out_values(XCsr_vmul *InstancePtr);

void XCsr_vmul_InterruptGlobalEnable(XCsr_vmul *InstancePtr);
void XCsr_vmul_InterruptGlobalDisable(XCsr_vmul *InstancePtr);
void XCsr_vmul_InterruptEnable(XCsr_vmul *InstancePtr, u32 Mask);
void XCsr_vmul_InterruptDisable(XCsr_vmul *InstancePtr, u32 Mask);
void XCsr_vmul_InterruptClear(XCsr_vmul *InstancePtr, u32 Mask);
u32 XCsr_vmul_InterruptGetEnabled(XCsr_vmul *InstancePtr);
u32 XCsr_vmul_InterruptGetStatus(XCsr_vmul *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
