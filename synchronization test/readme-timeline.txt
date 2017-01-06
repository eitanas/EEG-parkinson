Aufgaben (Versuche):
FE = figure eight (Achterkurve gehen)
NP = narrow passage (gehen durch enge Passage)
WWT = walk with turns (hin und her gehen)
Manchmal gibt es mehrere Versuche desselben Typs für einen Patienten, dann 
laufende Nummer hinter dem Aufgabencode im Dateinamen.

Fünf verschiedene Patienten:
P05, P08, P20, P21, P22
Am besten schauen Sie zuerst den Patienten P05 an.

Die Datei "timeline.txt" beschreibt die Ereignisse innerhalb der Versuche:

Spalte 1 ist der Zeitpunkt des Ereignisses.
Spalten 2 und 3 beschreiben den Typ der Ereignisse; zusammengehörige Ereig-
nisse (Beginn und Ende einer Phase) stehen jeweils in der gleichen Spalte.

0 = Beginn einer neuen Datei, Dateiname in Spalte 3
-1 = kein Ereignis (leerer Platz in Spalte 2, damit in Spalte 3 etwas stehen kann)
1 = Beginn normales Gehen (Phase 1)
11 = Ende normales Gehen
2 = Beginn FOG (Freezing of Gait, Phase 2)
12 = Ende FOG
3 = Beginn Stop (Stehenbleiben auf Aufforderung, Phase 3)
13 = Ende Stop
4 = Beginn Turn (Wende bei WWT, Phase 4)
14 = Ende Turn
5 = Beginn pre-FOG1 (10 bis 5 Sek. vor FOG, Phase 5)
15 = Ende pre-FOG1
6 = Beginn pre-FOG2 (5 bis 0 Sek. vor FOG, Phase 6)
16 = Ende pre-FOG2
7 = Beginn post-FOG (0 bis 5 Sek. nach FOG, Phase 7)
17 = Ende post-FOG

Beispiel:
0.00	0	NP1_MC-P05	# Beginn der Datei NP1_MC-P05.txt
2.00	6			# Beginn von pre-FOG2
4.67	16	2		# Ende pre-FOG2 und Beginn FOG (erste Episode)
9.94	7	12		# Ende FOG und Beginn post-FOG
12.99	-1	5		# Beginn pre-FOG1 der zweiten Episode (10 Sek. vorher)
14.94	17			# Ende post-FOG der ersten FOG-Episode
17.99	6	15		# Ende von pre-FOG1 und Beginn von pre-FOG2
22.99	16	2		# Ende pre-FOG2 und Beginn FOG (zweite Episode)

Hinweise dazu:
- Die Zeit (Spalte 1) startet bei jeder Datei mit 0.00 (Sekunden)
- Die ersten 2 Sek. jeder Datei werden ignoriert, damit die Daten stabil sind.
- Die Phasen 5, 6, und 7 sind kürzer als 5 Sekunden oder entfallen ganz, wenn die 
  Abstände zwischen FOGs (und ggf. anderen Ereignissen) zu kurz ausfallen.
- Die Phasen 5 und 7 dürfen überlappen, aber andere Phasen dürfen das nicht.
- Zu Störungen und zum Dateiende wird ein "Sicherheitsabstand" von 1 Sek. eingehalten.

