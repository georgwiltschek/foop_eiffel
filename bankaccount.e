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
