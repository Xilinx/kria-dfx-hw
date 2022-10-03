# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT

# Firmware Generation Flow

### Use bash shell
### Modify bootgen and dtc path in bingen.sh, genOverlay.sh and genPkg.py 

```bash
[plImages]$ vim bingen.sh
[plImages]$ vim genOverlay.sh
[plImages]$ vim genPkg.py
```
### Generate bin files, overlay and firmware package

```bash
[plImages]$ make all
```

### Clean

```bash
[plImages]$ make clean
```
