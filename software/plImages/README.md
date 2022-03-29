# Firmware Generation Flow

### Modify bootgen path in bingen.sh script

```bash
[plImages]$ vim bingen.sh
```

### Import bit files and generate bin files

```bash
[plImages]$ ./bingen.sh
```

### Generate Overlay

```bash
[plImages]$ ./genOverlay.sh
```

### Generate packages

```bash
plImages]$ ./genPkg.py
```
