# Firmware Generation Flow

### Use bash shell
### Modify bootgen and dtc path in bingen.sh, genOverlay.sh and genPkg.py 

```bash
[plImages]$ vim bingen.sh
[plImages]$ vim genOverlay.sh
[plImages]$ vim genPkg.py
```

### Import bit files and generate bin files

```bash
[plImages]$ make bin
```

### Generate Overlay

```bash
[plImages]$ make dtbo
```

### Generate packages

```bash
[plImages]$ make firmware 
```
### Clean

```bash
[plImages]$ make clean
```
