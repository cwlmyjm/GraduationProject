def var a : Integer := 7;
def var b : Integer := 8;
def var c : Integer := 9;
def fun odd(n : Integer) : Boolean = !((n / 2) * 2 == n);
def class Pair {
	var f : Integer := 8;
	var s : Integer := 9;

};

def proc mygetint() : Integer = 
	let 
		var mi : Integer;
	in
		begin
			getint(mi);
			return mi;
		end;
		
if true then
	begin
		putint(1);
		n := 20;
	end
elsif true then
	begin
		putint(2);
		n := 10;
	end
else
	getint(n);