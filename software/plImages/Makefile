all: bin dtbo firmware 

bin:
	./bingen.sh

dtbo: 
	./genOverlay.sh

firmware:
	./genPkg.py

clean:
	rm -rf *.bin *.bit *.bif *.dtbo *.xsa
