// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT
extern int writeBuff(u32* buff, int counts, UINTPTR address);
extern int readBuff(u32* buff, int counts, UINTPTR address);
extern int printBuff(int counts, UINTPTR address);
extern int zeroBuff(int counts, UINTPTR address);
extern compare(int counts, UINTPTR address, UINTPTR refaddress);
