let
	var id0 : Integer := 1;
	proc putint2() 
	let
		var id1 : Integer := 2;
		proc putint3()
		let
			var id3 : Integer := 3;
			proc putint4()
			let
				var id4 : Integer := 4
			in
				putint(id1)			
		in
			putint4()
	in
		putint3()
in
	putint2()
