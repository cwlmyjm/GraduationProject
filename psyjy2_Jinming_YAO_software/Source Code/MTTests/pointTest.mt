let
	var number : Integer := 100
in
	let
		proc f(out m :Integer)
		m := point(m) + 1
	in
		begin
			f(number);
			putint(number)
		end