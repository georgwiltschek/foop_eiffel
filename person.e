class
	PERSON

	inherit
		any

	export
	   	 {ANY} all
	end

	create
		erstellen

	feature {NONE}
		name: STRING

		alter: INTEGER

		addresse: STRING



	feature
		min_alter: INTEGER
		once
			Result := 18
		end

		erstellen (n, addr:STRING; a:INTEGER)
			require
				a >= min_alter
			do
				name := n
				alter := a
				addresse := addr
			ensure
				name = n
				alter = a
				addresse = addr
			end

		feature
			info
				do
					print (name + ", " + alter.out + ", " + addresse + "%N")
				end

end
