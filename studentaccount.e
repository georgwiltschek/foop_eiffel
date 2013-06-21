class
	STUDENTACCOUNT

inherit
	BANKACCOUNT
	redefine
		eroeffnen, min_buchungsbetrag, ueberweisung_an
	end

create
	eroeffnen

feature
	min_buchungsbetrag: DOUBLE
	once
		Result := 1.0
	end

feature
	-- zb muss ein student sein
	eroeffnen (u, sz, hz: DOUBLE; zb: STUDENT)
		do
			Precursor (u, sz, hz, zb)
		end
		
	ueberweisung_an (k: STUDENTACCOUNT; betrag: DOUBLE)
		do
			kontostand := kontostand - betrag
			k.ueberweisung_von(CURRENT, betrag)
		end

end
