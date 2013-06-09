-- Schreiben Sie ein Programm zur Verwaltung von Bankkonten.
-- Jedes Konto verf�gt �ber Angaben zu den Zeichnungsberechtigten,
-- einen Kreditrahmen (bei dessen �berschreitung die Bank in der
-- Regel keine weitere �berziehung zul�sst), je einen Prozentsatz
-- f�r die Sollverzinsung (Zinsen f�r den Betrag, um den das Konto
-- �berzogen ist) und Habenverzinsung (Zinsen f�r das Guthaben am
-- Konto) und den aktuellen Betrag am Konto. Es sollen Operationen
-- f�r Bareinzahlungen, Barauszahlungen, �berweisungen zwischen
-- Konten sowie Abfragen und �nderungen der zu den Konten
-- gespeicherten Daten (ausgenommen �nderungen des Guthabens)
-- unterst�tzt werden.

-- Auf Konten sollen zumindest folgende Zusicherungen gelten: Die
-- Verzinsung und der Kreditrahmen sollen stets innerhalb der vom
-- Kreditinstitut vorgegebenen Grenzen bleiben. Es gibt einen
-- Mindestbetrag von 2 Euro f�r jede Einzahlung, Auszahlung und
-- �berweisung.

class BANKACCOUNT
	inherit
		any
	
	export
	   	 {ANY} all
	end

	create
		eroeffnen

	feature -- vars
		kontostand: DOUBLE
		soll_zinsen: DOUBLE
		haben_zinsen: DOUBLE
		zeichnungsberechtigter: STRING
		ueberziehungsrahmen: DOUBLE
		
		min_buchungsbetrag: DOUBLE
		once
			Result := 2.0
		end
		
		max_ueberziehungsrahmen: DOUBLE
		once
			Result := 5000
		end
		
		min_soll_zinsen: DOUBLE
		once
			Result := 1.0
		end
		
		max_soll_zinsen: DOUBLE
		once
			Result := 3.0
		end
		
		min_haben_zinsen: DOUBLE
		once
			Result := 1.0
		end
		
		max_haben_zinsen: DOUBLE
		once
			Result := 3.0
		end

	feature -- constructor 
		eroeffnen (u, sz, hz: DOUBLE; zb: STRING)
				-- kontoeroeffnung
			do
				ueberziehungsrahmen := u
				soll_zinsen := sz
				haben_zinsen := hz
				zeichnungsberechtigter:= zb
			end

	feature -- informationen
		info
			--
			do
				print (zeichnungsberechtigter + "%N")
				print (kontostand)
				print ("%N")
				print (ueberziehungsrahmen)
				print ("%N")
			end

	feature -- ein/auszahlung
		bareinzahlung (betrag: DOUBLE)
			require
				betrag >= min_buchungsbetrag
			do
				kontostand := kontostand + betrag
			end

		barauszahlung (betrag: DOUBLE)
			require
				betrag >= min_buchungsbetrag
				kontostand - betrag + ueberziehungsrahmen >= 0
			do
				kontostand := kontostand - betrag
			end
end
