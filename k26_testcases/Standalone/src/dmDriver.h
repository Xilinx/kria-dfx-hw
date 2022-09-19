// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
extern int gicConfig(Xil_ExceptionHandler DeviceInterruptHandler, void *data);

extern int configDMSlots(u64 rm0_base, u64 rm1_base);
extern int S2MMStatus(int slot);
extern int MM2SStatus(int slot);
extern int MM2SData(int slot, u64 data, u64 size, u8 tid);
extern int MM2SDataA(int slot, u64 data, u64 size, u8 tid);
extern int S2MMData(int slot, u64 data, u64 size);
extern int S2MMDone(int slot);
extern int MM2SDone(int slot);
extern int S2MMAck(int slot);
extern int MM2SAck(int slot);
extern int sihaConfig();
extern int getS2MMProcessed(int slot);
extern int getMM2SProcessed(int slot);
