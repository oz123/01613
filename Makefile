RM = rm -f
FLAGS =  -Cr -O1 -gv -gw -g -vw

builddir = ./build/

example1:  

	fpc 01_Kreisumfang.pas $(FLAGS) -o$(builddir)01_Kreisumfang
		
clean:
	$(RM) $(builddir)*
