let
	proc f()
	while true do
	begin
		putint(200);
		sleep(1000)
	end;
	var x : Integer
in
	begin
		threadStart(x,f());
		threadCancel(x);
		putint(x);
		threadStart(x,f());
		threadCancel(x);
		putint(x);
		threadStart(x,f());
		threadCancel(x);
		putint(x);
		threadStart(x,f());
		threadCancel(x);
		putint(x)
	end