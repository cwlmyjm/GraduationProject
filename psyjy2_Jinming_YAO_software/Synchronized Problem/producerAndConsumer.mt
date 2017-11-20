// simple producer and consumer problem
let
	var size   : Integer := 8;
	var buffer : Integer[8] := [0,0,0,0,0,0,0,0];
	var inp    : Integer := 0;
	var outp   : Integer := 0;
	var empty  : Integer := 8;
	var full   : Integer := 0;
	var lock   : Integer := 0;
	var i  	   : Integer := 0;
	var id     : Integer[4]
in
	let
		proc producer(id:Integer)
		let
			var item 	: Integer := 0
		in
		while true do
		begin
		    sleep(1000);
			semWait(empty);
			threadLock(lock);
			i := i + 1;
			item := i;
			buffer[inp] := item;
	
			putchr('=');
			putchr('i');
			putchr('d');
			putint(id);
			putchr('p');
			putchr('r');
			putchr('o');
			putint(item);
			putchr('a');
			putchr('t');
			putint(inp+1);
		
			inp := (inp+1)%size;
			threadUnlock(lock);
			semPost(full)
		end;
		
		proc consumer(id:Integer)
		let
			var item 	: Integer := 0
		in
		while true do
		begin
		    sleep(1000);
			semWait(full);
			threadLock(lock);
			
			item := buffer[outp];
			buffer[outp] := 0;
			
			putchr('=');
			putchr('i');
			putchr('d');
			putint(id);
			putchr('c');
			putchr('o');
			putchr('n');
			putint(item);
			putchr('a');
			putchr('t');
			putint(outp+1);
			
			outp := (outp+1)%size;
			threadUnlock(lock);
			semPost(empty)
		end
	in
	begin
		threadStart(id[0],producer(1));
		threadStart(id[1],producer(2));
		threadStart(id[2],consumer(3));
		threadStart(id[3],consumer(4));
		threadWait(id[0]);
		threadWait(id[1])
	end