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
	per: PERSON
	st: STUDENT
	pen: PENSIONIST
	k1: BANKACCOUNT
	s1: STUDENTACCOUNT
	p1: PENSIONSACCOUNT

	make
			-- Run application.
		do
			-- personen erstellen
			create per.erstellen("Max Mustermann", "Musterstrasse 1", 34)
			create st.erstellen("Max Musterschueler", "Musterweg 123", 23)
			create pen.erstellen("Max Muster", "abc" , 60)
		--  verletzt precondition: pensionisten alter >= 60
		--	create pen.erstellen("Max Muster", "abc" , 59)

			-- neues konto anlegen
			create k1.eroeffnen(500,1,2,per)
			k1.bareinzahlung(100)
			k1.barauszahlung(25)
			k1.barauszahlung(175)

			-- verletzt barauszahlungspostkondition fuer ueberziehungsrahmen
-- k1.barauszahlung(100000)
-- k1.info

			-- verletzt barauszahlungspostkondition fuer ueberziehungsrahmen
			-- fuer mindesteinzahlung
-- k1.bareinzahlung(1)
-- k1.info
			create s1.eroeffnen(500,1,2,st)
			--create s1.eroeffnen(500,1,2,per)
			s1.bareinzahlung(1)


			k1.info
			s1.info

			k1.ueberweisung_an(s1, 10.0)

			k1.info
			s1.info

			create p1.eroeffnen(500,1,2,pen)
			p1.info
--			p1.bareinzahlung(1.2)
--		p1.info

		end
end
