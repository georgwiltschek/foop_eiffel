note
	description : "foop application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	k1: BANKACCOUNT
	s1: STUDENTACCOUNT
	
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
			
			-- verletzt barauszahlungspostkondition fuer ueberziehungsrahmen
			-- k1.barauszahlung(100000)
			-- k1.info
			
			-- verletzt barauszahlungspostkondition fuer ueberziehungsrahmen
			-- fuer mindesteinzahlung
			-- k1.bareinzahlung(1)
			-- k1.info
			create s1.eroeffnen(500,1,2,"Max Musterschueler")
			s1.info
			s1.bareinzahlung(1.2)
			s1.info
		end
end
