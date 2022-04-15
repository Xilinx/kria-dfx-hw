############################## Help Section ##############################
.PHONY: help

help::
	@echo 'Makefile Usage:'
	@echo ''
	@echo '  make all'
	@echo '      Command used to generate bin, dtbo and k26_2rp firmware folder.'
	@echo ''
	@echo '  make bin'
	@echo '      Command used to Import bit files and generate bin files.'
	@echo ''
	@echo '  make dtbo'
	@echo '      Command used to take pl.dtsi as input and generate pl.dtbo file.'
	@echo ''
	@echo '  make firmware'
	@echo '      Command used to generate k26_2rp firwmare files.'
	@echo ''	
	@echo '  make clean'
	@echo '      Command to remove all the generated files.'
	@echo ''

.PHONY: bin dtbo firmware clean

all: bin dtbo firmware 

bin:
	./bingen.sh

dtbo: 
	./genOverlay.sh

firmware:
	./genPkg.py

clean:
	rm -rf *.bin *.bit *.bif *.dtbo *.xsa k26_2rp tmp
