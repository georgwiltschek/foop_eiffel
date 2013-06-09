note
	description : "foop application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS
	BANKACCOUNT

create
	make

feature {NONE} -- Initialization

	k1, k2, k3, k4, k5, k6, k7, k8, k9: BANKACCOUNT
	
	make
			-- Run application.
		do
			
			-- neues konto anlegen
			create k1.eroeffnen(500,1,2,"Max Mustermann")
			k1.info
			k1.bareinzahlung(100)
			k1.info
			k1.barauszahlung(25)
			k1.info
			k1.barauszahlung(175)
			k1.info
			
			-- verletzt barauszahlungspostkondition 
			k1.barauszahlung(100000)
			k1.info
		end

end
