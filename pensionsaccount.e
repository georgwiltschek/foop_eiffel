class
	PENSIONSACCOUNT

inherit
	BANKACCOUNT
	redefine
		eroeffnen, min_buchungsbetrag
	end

create
	eroeffnen

feature
	min_buchungsbetrag: DOUBLE
	once
		Result := 1.0
	end

feature
	-- zb muss ein Pensionist sein
	eroeffnen (u, sz, hz: DOUBLE; zb: PENSIONIST)
		do
			Precursor (u, sz, hz, zb)
		end
end
