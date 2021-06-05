files=favicon16.ico favicon32.ico favicon48.ico favicon64.ico

favicon.ico: $(files)
	convert $(files) $@

$(files): favicon.png Makefile
	s=`echo $@ | sed -r "s,^[^0-9]*([0-9]*)\..*$$,\1,"` ;	\
	test ! -z "$$s" && convert $< -resize "$$s!x$$s!" $@

favicon.png: Makefile
	convert -size 321x170 "canvas:none"			\
	-font /usr/share/fonts/opentype/ipafont-gothic/ipag.ttf	\
	-pointsize 240						\
	-channel RGBA -fill "#757575"				\
	-draw "text -25,182 \"ICN\""				\
	$@

clean:
	rm -rfv *~ .*~ *.png *.ico
