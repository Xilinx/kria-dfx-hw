# Firmware Generation Flow

### Use bash shell
### Modify bootgen path in bingen.sh script

```bash
[plImages]$ vim bingen.sh
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
