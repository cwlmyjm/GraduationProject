let
	var id : Integer := 100;
	proc putint2() 
	let
		var p : Integer := 2010;
		var q : Integer := 2013
	in
		begin
			p := q + 1;
			q := q + q
		end
		
in
	begin
		threadStart(id,putint2());
		threadWait(id)
	end
				