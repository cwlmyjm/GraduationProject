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
			end
		in
			begin
				threadStart(id0,f());
				threadStart(id1,x:=x+1);
				threadWait(id1);
				putint(x);
		        threadWait(id0)
			end