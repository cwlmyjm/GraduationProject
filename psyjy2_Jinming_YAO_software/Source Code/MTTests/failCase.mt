let
	var id0:Integer;
	var x : Integer := 100
in
begin
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
			threadStart(id0,f());
			
	threadWait(id0)
end