# Firmware Generation Flow

### Use bash shell
### Modify bootgen and dtc path in bingen.sh, genOverlay.sh and genPkg.py 

### Use either step 1 or step 2,3 and 4. 

```bash
[plImages]$ vim bingen.sh
[plImages]$ vim genOverlay.sh
[plImages]$ vim genPkg.py
```
### 1. Generate bin files, overlay and firmware package

```bash
[plImages]$ make all
```

### 2. Import bit files and generate bin files

```bash
[plImages]$ make bin
```

### 3. Generate Overlay

```bash
[plImages]$ make dtbo
```

### 4. Generate packages

```bash
[plImages]$ make firmware 
```
### Clean

```bash
[plImages]$ make clean
```
