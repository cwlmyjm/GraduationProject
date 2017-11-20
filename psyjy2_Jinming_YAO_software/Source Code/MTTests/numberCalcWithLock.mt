let
	var number : Integer := 0;
	var lock : Integer := 0;
	var id0 : Integer;
	var id1 : Integer
in
	let
		var some : Integer := 2000;
		proc thread()
		let
			var i : Integer := 123
		in
			while i < 133 do
			begin
				threadLock(lock);
				number := number + 1;
				threadUnlock(lock);
				i := i + 1
			end
	in
		begin
			threadStart(id0,thread());
			threadStart(id1,thread());
			putchr('v');
			putint(id0);
			putchr('v');
			putint(id1);
			threadWait(id0);
			threadWait(id1);
			putchr('n');
			putchr('u');
			putchr('m');
			putchr('b');
			putchr('e');
			putchr('r');
			putchr(':');
			putint(number);
			putchr('\n')
		end