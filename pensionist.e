class
	PENSIONIST

	inherit
		PERSON
		redefine
			min_alter
		end

	create
		erstellen

	feature
		-- muss mindestens 60 Jahre alt sein
		min_alter: INTEGER
		once
			Result := 60
		end

end
