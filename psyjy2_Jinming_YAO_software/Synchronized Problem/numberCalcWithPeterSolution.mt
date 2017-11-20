let
	var flag : Boolean[2] := [false,false];
	var turn : Integer := 0;
	var number : Integer := 0;
	var id0 : Integer;
	var id1 : Integer
in
	let
		proc thread1()
			let
				var i : Integer := 123
			in
			while i < 133 do
				begin
					flag[0] := true;
					turn := 1;
					while flag[1] && turn == 1 do
						begin
							putchr('1');
							putchr('w');
							putchr('a');
							putchr('i');
							putchr('t');
							putchr('\n')
						end;
					number := number + 1;
					flag[0] := false;
					i := i + 1
				end;
		proc thread2()
			let
				var i : Integer := 123
			in
			while i < 133 do
				begin
					flag[1] := true;
					turn := 0;
					while flag[0] && turn == 0 do
						begin
							putchr('2');
							putchr('w');
							putchr('a');
							putchr('i');
							putchr('t');
							putchr('\n')
						end;
					number := number + 1;
					flag[1] := false;
					i := i + 1
				end
	in
		begin
			threadStart(id0,thread1());
			threadStart(id1,thread2());
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