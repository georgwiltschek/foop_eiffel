-- Schreiben Sie ein Programm zur Verwaltung von Bankkonten.
-- Jedes Konto verfügt über Angaben zu den Zeichnungsberechtigten,
-- einen Kreditrahmen (bei dessen Überschreitung die Bank in der
-- Regel keine weitere Überziehung zulässt), je einen Prozentsatz
-- für die Sollverzinsung (Zinsen für den Betrag, um den das Konto
-- überzogen ist) und Habenverzinsung (Zinsen für das Guthaben am
-- Konto) und den aktuellen Betrag am Konto. Es sollen Operationen
-- für Bareinzahlungen, Barauszahlungen, Überweisungen zwischen
-- Konten sowie Abfragen und Änderungen der zu den Konten
-- gespeicherten Daten (ausgenommen Änderungen des Guthabens)
-- unterstützt werden.

-- Auf Konten sollen zumindest folgende Zusicherungen gelten: Die
-- Verzinsung und der Kreditrahmen sollen stets innerhalb der vom
-- Kreditinstitut vorgegebenen Grenzen bleiben. Es gibt einen
-- Mindestbetrag von 2 Euro für jede Einzahlung, Auszahlung und
-- Überweisung.

class BANKACCOUNT
	inherit
		ANY

	export
	   	 {NONE} all
	end

	create
		eroeffnen

	feature -- vars
		kontostand: DOUBLE
		soll_zinsen: DOUBLE
		haben_zinsen: DOUBLE
		zeichnungsberechtigter: PERSON
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
		eroeffnen (u, sz, hz: DOUBLE; zb: PERSON)
			-- kontoeroeffnung
			require
				u <= max_ueberziehungsrahmen
				sz >= min_soll_zinsen
				sz <= max_soll_zinsen
				hz >= min_haben_zinsen
				hz <= max_haben_zinsen
			do
				ueberziehungsrahmen := u
				soll_zinsen := sz
				haben_zinsen := hz
				zeichnungsberechtigter := zb
			ensure
				ueberziehungsrahmen = u
				soll_zinsen = sz
				haben_zinsen = hz
				zeichnungsberechtigter = zb
			end

	feature -- informationen
		info
			--
			do
				zeichnungsberechtigter.info
				print (kontostand)
				print ("%N")
				print (ueberziehungsrahmen)
				print ("%N------------------------%N")
			end

	feature -- ein/auszahlung
		bareinzahlung (betrag: DOUBLE)
			--
			require
				betrag >= min_buchungsbetrag
			do
				kontostand := kontostand + betrag
			ensure
				kontostand - betrag = OLD kontostand
			end

		barauszahlung (betrag: DOUBLE)
			require
				betrag >= min_buchungsbetrag
				kontostand - betrag + ueberziehungsrahmen >= 0
			do
				kontostand := kontostand - betrag
			ensure
				kontostand + betrag = OLD kontostand
			end

		ueberweisung_an (k: BANKACCOUNT; betrag: DOUBLE)
			require
				betrag <= kontostand + ueberziehungsrahmen
			do
				kontostand := kontostand - betrag
				k.ueberweisung_von(CURRENT, betrag)
			ensure
				kontostand + betrag = OLD kontostand
			end

		ueberweisung_von (k: BANKACCOUNT; betrag: DOUBLE)
			require
				-- ?
			do
				kontostand := kontostand + betrag
			ensure
				kontostand - betrag = OLD kontostand
			end
end
