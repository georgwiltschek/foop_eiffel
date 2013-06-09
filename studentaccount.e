class
	STUDENTACCOUNT

inherit
	BANKACCOUNT
	redefine
		bareinzahlung
	end

create
	eroeffnen
	
feature -- ein/auszahlung
	bareinzahlung (betrag: DOUBLE)
		require else
			betrag > 1.0
		do
			kontostand := kontostand + betrag
		end
end
