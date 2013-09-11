RM = rm -f
FLAGS =  -Cr -O1 -gv -gw -g
example1:  

	fpc 01_Kreisumfang.pas $(FLAGS) -o01_Kreisumfang
		
clean:
	$(RM) *.o
