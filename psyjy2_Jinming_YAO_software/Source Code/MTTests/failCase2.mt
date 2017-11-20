let
	var id0:Integer;
	var id1:Integer;
	var x : Integer := 100
in
	let
		var y : Integer := 200
    in
		let
			proc f()
			while true do
			begin
				putint(y);
				sleep(1000)
			end;
			proc g()
			begin
				sleep(20000);
				threadCancel(id0)
			end
		in
		begin
			threadStart(id0,f());
			threadStart(id1,g());
			threadWait(id0);
			putchr('e')
		end