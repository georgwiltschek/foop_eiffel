* Wie hoch ist der Aufwand in Eiffel, um Zusicherungen im Programmcode zu formulieren?

gering - require, ensure, invariant bloecke je methode


* Wie stark wirkt sich die Überprüfung von Zusicherungen auf die Laufzeit aus?

jeweils 10000 durchlauefe

mit ueperpruefung:
zsh test.sh  25.98s user 39.19s system 76% cpu 1:25.72 total
zsh test.sh  27.49s user 39.57s system 76% cpu 1:27.74 total
zsh test.sh  26.64s user 40.08s system 76% cpu 1:27.17 total
zsh test.sh  25.84s user 40.52s system 76% cpu 1:27.04 total
zsh test.sh  25.39s user 38.17s system 76% cpu 1:23.56 total

ohne ueberpruefung:
zsh test.sh  25.98s user 39.45s system 76% cpu 1:25.75 total
zsh test.sh  26.68s user 40.49s system 76% cpu 1:27.66 total
zsh test.sh  25.94s user 40.02s system 76% cpu 1:26.48 total
zsh test.sh  26.23s user 40.72s system 76% cpu 1:27.61 total
zsh test.sh  26.39s user 39.91s system 76% cpu 1:26.75 total

Generell: 
abhaengig von der Art und Anzahl der Assertions

* Vorbedingungen dürfen im Untertyp nicht stärker und Nachbedingungen nicht schwächer werden um Ersetzbarkeit zu garantieren. Der Eiffel-Compiler überprüft diese Bedingungen. Ist es (trotz eingeschalteter Überprüfung von Zusicherungen) möglich diese Bedingungen zu umgehen? Wenn ja, wie?

Nein(?)
Vor/Nachbedingungen zwischen Ober- und Untertyp werden nicht auf staerker/schwaecher ueberprueft, sondern koennen nur mit require else und ensure then im Untertyp mit den Bedingungen im Obertyp verknuepft werden.

* Eiffel erlaubt kovariante Eingangsparametertypen. Unter welchen Bedingungen führt das zu Problemen, und wie äußern sich diese? Können Sie ein Programm schreiben, in dem die Verwendung kovarianter Eingangsparametertypen zu einer Exception führt?

* Vereinfachen kovariante Eingangsparametertypen die Programmierung? Unter welchen Bedingungen ist das so?
