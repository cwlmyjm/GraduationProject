let
	var number : Integer := 0;
	var id0 : Integer;
	var id1 : Integer
in
	let
		proc thread()
		let
			var i : Integer := 123
		in
			while i < 133 do
			begin
				number := number + 1;
				i := i + 1
			end
	in
		begin
			threadStart(id0,thread());
			threadStart(id1,thread());
			putint(id0);
			putint(id1);
			threadCancel(id0);
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