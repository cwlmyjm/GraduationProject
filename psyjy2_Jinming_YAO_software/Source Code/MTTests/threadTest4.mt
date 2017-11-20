let
	var id : Integer := 100;
	var i : Integer := 0;
	proc putint2() 
    while true do putint(2012);
	proc putint3() 
    while true do putint(2013);
	proc putint4() 
		while i < 5 do 
			begin
				i := i + 1;
				putint(i)
			end
in
	begin
		threadStart(id,putint4());
		threadStart(id+1,putint3());
		threadWait(id);
		while i < 10 do 
		    begin
				putint(2014);
				i := i + 1
			end;
		threadCancel(id+1);
		while true do putint(2)
	end
				