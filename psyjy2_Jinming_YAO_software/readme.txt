Source Code:
This folder contains the source code of the compiler and interpreter.
Using above command to compile the source code:

	clyde$ gmake
	
Then you will get a program call hmtc in linux or htmc.exe in windows.
To compile the program wrote in Mini-Triangle, use the following command:

	clyde$ ./hmtc filename
	
	e.g 
		./hmtc MTTests/test2.mt
	
	Then you will get an test2.tam.
	
To execute the program, you can use following command:

	clyde$ ./hmtc filename
	
	e.g 
		./hmtc MTTests/test2.tam
		
	Then the program will be executed.
	
Besides, you can also execute the program from source code directly by add --run, --run-traced and --run-step

	e.g 
		./hmtc --run MTTests/test2.mt
		./hmtc --run-traced MTTests/test2.mt
		./hmtc --run-step MTTests/test2.mt

	
Synchronized Problem:
This folder contains the classic synchronized problems wrote in the extended Mini-Triangle.
