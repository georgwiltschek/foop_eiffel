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

class BANKACCOUNT
	inherit
		any

	export
	     {ANY} all
	end

	create
		eroeffnen

	feature {NONE} -- Initialization
		eroeffnen (u, sz, hz: DOUBLE; zb: STRING)
				-- kontoeroeffnung
			do
				ueberziehungsrahmen := u
				soll_zinsen := sz
				haben_zinsen := hz
				zeichnungsberechtigter:= zb
			end

	feature
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
		kontostand: DOUBLE
		ueberziehungsrahmen: DOUBLE
		soll_zinsen: DOUBLE
		haben_zinsen: DOUBLE
		zeichnungsberechtigter: STRING

		bareinzahlung (betrag: DOUBLE)
			do
				kontostand := kontostand + betrag
			end

		barauszahlung (betrag: DOUBLE)
			require
				kontostand + betrag >= ueberziehungsrahmen
			do
				kontostand := kontostand - betrag
			end
end
