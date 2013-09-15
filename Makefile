RM = rm -f
FLAGS =  -Cr -O1 -gv -gw -g -vw

builddir = ./build/

all: example1 example3  

example1:  

	fpc 01_Kreisumfang.pas $(FLAGS) -o$(builddir)01_Kreisumfang
		
example3:

	fpc 03_EuroBetrag3.pas $(FLAGS) -o$(builddir)03_EuroBetrag3


clean:
	$(RM) $(builddir)*
