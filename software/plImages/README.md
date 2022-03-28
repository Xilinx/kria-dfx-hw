# Firmware Generation Flow

### Modify bootgen path and partial names in bingen.sh script

```bash
[plImages]$ vim bingen.sh
```

### Import bit files and gen bin files

```bash
[plImages]$ ./bingen.sh
```

### Generate Overlay

```bash
[plImages]$ ./genOverlay.sh
```

### Generate packages

```bash
plImages]$ cd ..

[software]$ ./scripts/genPkg2RP.py
```

