let
	var id1 : Integer := 100;
	var id2 : Integer := 101;
	var id3 : Integer := 102;
	var i : Integer := 0;
	var lock : Integer := 0
in
	let
		proc putint2() 
		while i < 20 do
			begin
				threadLock(lock);
				if i < 20 then
					begin
						putchr('a');
						putint(i);
						i := i + 1
					end;
				threadUnlock(lock)
			end;
		proc putint3() 
		while i < 20 do
			begin
				threadLock(lock);
				if i < 20 then
					begin
						putchr('b');
						putint(i);
						i := i + 1
					end;
				threadUnlock(lock)
			end;
		proc putint4() 
		while i < 20 do
			begin
				threadLock(lock);
				if i < 20 then
					begin
						putchr('c');
						putint(i);
						i := i + 1
					end;
				threadUnlock(lock)
			end
	in		
		begin
			threadStart(id1,putint2());
			threadStart(id2,putint3());
			threadStart(id3,putint4());
			threadWait(id1);
			threadWait(id2);
			threadWait(id3);
			while i < 25 do 
				begin
					putint(2014);
					i := i + 1
				end
		end
				