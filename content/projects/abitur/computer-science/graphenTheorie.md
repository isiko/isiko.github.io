---
title: "Graphentheorie"
date: 2022-03-07T00:00:00+01:00
draft: false
authorTwitter: "isi_ko404"
tags: ["school", "computer-science", "Graphen", "Navigation"]
keywords: ["Abitur", "A-levels", "Computer-science", "Informatik"]
description: "Alles über Graphen Theorie"
showFullContent: false
readingTime: false
---

# Traversierung
Geht den ganzen Graphen ab. Kann auch zur Suche eines Knotens benutzt werden. Kann Theoretisch auch als Routenplaner verwendet werden

## Breiten Traversierung
Kommt noch
## Tiefen Traversierung
Kommt noch

# Minimal-Spanning Tree
Generiert eine Version des gegebenen Graphens, der alle Knoten umfasst, allerdings nur das absolute Minimum an Kanten enthält (nach Gewicht)

## Kruskal
1. Kanten nach Gewicht sortieren
2. Jede Kante Prüfen
    - Wenn durch das einsetzen der Kante in den neuen Graphen kein Kreis entsteht: einsetzten
    - Ansonsten Löschen
Bei einem getrennten Graphen wird auch der Output getrennt sein.

## Prim
1. Zufällige Startposition wählen und Markieren
2. Von allen Markierten Knoten die Günstigste Verbindung zu einem Nicht Markierten Knoten suchen und einsetzen
3. Schritt 2 solange wieder holen, bis alle Knoten Markiert sind
Bei einem Getrennten Graphen wird Prim irgendwann in einer Endlosschleife sein.

# Routenplanung
Noch kein Optimaler Algorithmus gefunden
## Dijkstra
1. Alle Allen Knoten den Abstand ∞ zu weisen
2. Dem Startknoten den Wert 0 zu weisen
3. den Startknoten zum aktuellen Knoten machen
4. Falls ein Nachbarknoten einen höheren Abstand als der Abstand des eigenen Knoten + das Kantengewicht zum NAchbarknoten hat, diesen Wert erneuern
5. Selbiges auch Umgekehrt ausführen
5. Den aktuellen Knoten Markieren
6. Falls der Aktuelle Knoten nicht das Ziel war, den nicht markierten Knoten der den niedrigsten Abstand hat zum Aktuellen Knoten machen. Ansonsten Abbrechen
7. Zurück zu Schritt 4