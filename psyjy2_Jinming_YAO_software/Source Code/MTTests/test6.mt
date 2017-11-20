// Basic tests for the Part I and Part II extensions.

def var c : Character := 'x';
def var n : Integer;
def fun odd(n : Integer) : Boolean = !((n / 2) * 2 == n);
begin
    if true then
		begin
        putint(1);
		n := 20
		end
    elsif true then
        begin
		putint(2);
		n := 10
		end
    else
        getint(n);
    repeat
        begin
            n := odd(n) ? n * 3 + 1 : n / 2;
            putint(n)
        end
    until n == 1;
    putchr(c)
end

    
