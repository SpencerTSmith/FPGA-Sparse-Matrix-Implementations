// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xcsr_vmul.h"

extern XCsr_vmul_Config XCsr_vmul_ConfigTable[];

#ifdef SDT
XCsr_vmul_Config *XCsr_vmul_LookupConfig(UINTPTR BaseAddress) {
	XCsr_vmul_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XCsr_vmul_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XCsr_vmul_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XCsr_vmul_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCsr_vmul_Initialize(XCsr_vmul *InstancePtr, UINTPTR BaseAddress) {
	XCsr_vmul_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCsr_vmul_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCsr_vmul_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XCsr_vmul_Config *XCsr_vmul_LookupConfig(u16 DeviceId) {
	XCsr_vmul_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCSR_VMUL_NUM_INSTANCES; Index++) {
		if (XCsr_vmul_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCsr_vmul_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCsr_vmul_Initialize(XCsr_vmul *InstancePtr, u16 DeviceId) {
	XCsr_vmul_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCsr_vmul_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCsr_vmul_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

