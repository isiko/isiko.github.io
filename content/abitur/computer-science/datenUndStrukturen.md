---
title: "Daten und ihre Strukturierung"
date: 2022-03-07T00:00:00+01:00
draft: false
authorTwitter: "isi_ko404"
tags: ["school", "computer-science", "Datenbanken", "Diagramme"]
keywords: ["abitur", "a-levels", "computer-science", "Informatik"]
description: "Diagramme, Datenbanken"
showFullContent: false
readingTime: false
---

# Objekte und Klassen

## Diagramme
Um beim schreiben von Software eine grobe Idee zu haben was man eigendlich Machen muss ist es Sinnvoll eine grobe Idee zu haben was man macht. Dazu hat die Informatik sich einige Diagramme überlegt, und das Abitur in NRW hat sogar noch eins mehr! Im folgenden möchte ich einen Überblick über die verschiedenen Diagramme geben, wobei ich sie in der Reihenfolge vorstelle in der sie normalerweise erstellt werden.

### Objektdiagramm
- Beschreibt einen Zustand des Programms
    - Konkrete Werte für Attribute
    - keine Methoden
- Alle Objekte mit Runden Ecken
- Pfeile für Interaktionen zwischen den Objekten

### Klassendiagramme
Alle Objekte müssen einer Klasse zugehören, wesshalb auch hierfür Diagramme notwendig sind.

#### Klassentypen
Klasse ist nicht unbedingt gleich Klasse, es gibt 2 wichtige Merkmale die sie aufweisen können:

- Interfaces
    - Interfaces haben keine Attribute
    - Methoden sind nur mit Methodenkopf angegeben
    - Es kann nicht dierekt ein Objekt von ihnen erstellt werden, nur ihre Unterklassen können instanziiert werden

#### Beziehungen
Klassen stehen meist in Beziehungen mit anderen Klassen, gekennzeichnet durch verschiedene Arten von Pfeilen. Im folgenden werde ich versuchen alle zu erklären, wobei ich immer von `A -> B` ausgehen werde

- Assoziation
    - Bedeutung: Objekte der Klasse `A` können auch eine bestimmte anzahl an Objekten der Klasse `B` zugreifen
    - gekennzeichnet durch einen einfachen Pfeil
    - Kardinalität 
        - Indikator der Anzahl an Objekten der Klasse `B` die von einem Objekt der Klasse `A` zugegriffen werden kann. (meist entweder 0 oder 0..n)
        - Steht bei der Pfeilspitze
    - Haben einen Namen
- Vererbung
    - Bedeutung: Jeglicher Code der Klasse `B` wird auch der Klasse `A` zur verfügung gestellt
    - Dargestellt duch einen Pfeil mit einem nicht ausgefüllten Dreieck als Spitze
        - Beim erben von einem Interface wird der Pfeil gestrichelt gezeichnet
    - Wichtig: Pfeil geht von der Unteklasse zur Superklasse

### Entwurfsdiagramm
- Beschreibt alle Klassen des späteren Programms
    - Inhalte für jede Klassen:
        - Klassenname
        - Attribute (mit Pseudodatentyp)
        - Methoden (mit Pseudodatentyp)
    - Selbst Bibliotheken müssen theoretisch mit aufgezeichnet werden (siehe z.B. Stack, Queue, ...)
- Komplett unabhängig von Programm Code
    - Datentypen NICHT wie in Java, stattdessen andere Namen:
        - Integer => Zahl
        - String => Text
        - Boolean => Wahrheitswert
        - Stack/Queue/List/... => Datensammlung<>
            - in den spitzen Klammern steht hier der Datentyp der Elemente

### Implementationsdiagramm
- Präzisierung der Entwurfsdiagramms
- Näher an der verwendeten Programmiersprache
- Verwendet echt Datentypen anstelle von Pseudodatentypen
- Markierung von Interfaces und Abstrakten Klassen
    - Interfaces
        - Interfaces haben keine Attribute
        - Methoden sind nur mit Methodenkopf angegeben
        - Es kann nicht dierekt ein Objekt von ihnen erstellt werden, nur ihre Unterklassen können instanziiert werden
        - Im Implementationsdiagramm wird über den Klassennamen mittig `<<inteface>>` geschrieben
    - Abstrakte Klassen
        - Sind als Schablone für ander ähnliche Klassen zu verstehen
            - Bsp. Fahrzeug als Abstrakte Klasse und Auto oder Roller als Unterklassen
        - Es kann nicht direkt ein Objekt von ihnen erstellt werden, nur ihre Unterklassen können instanziiert werden
        - Im Implementatinsdiagramm wird unter den Klassennamen rechts `{{abstract}}` geschrieben
- gängige Konzepte wie Listen, Stacks oder Queues können müssen nicht mit Attributen und Methoden aufgeschrieben werden, es reicht der Klassenname
    - Hier muss aber der Contenttype angegeben werden

### Struktogramme
Kommt noch

## Lineare Strukturen
(Dokumentation wird in der Klausur bereitgestellt)
- Stack
- Queue
- List

## Nicht-Lineare Strukturen
(Dokumentation wird in der Klausur bereitgestellt)
- Binary Tree
- Binary Search Tree
- Graph

# Datenbanken
Datenbanken sind ein einfacher zentraler Massenspeicher der von mehreren Programmen gleichzeitig genutzt werden kann.
## Modelierung
Kommt noch

## Anomalien
Durch das verändern der Datenbank kann es sein das sie Fehlerhaft wird. Diese `Anomalien` können teilweise durch kluges Modelieren vermieden werden. Gegen mutwillige zerstörung hilft das aber auch nicht.
### Arten
- Löschanomalien
- Eingügeanomalien
- Aktualisierungsanomalien
### Normalisierung
1. Ein Wert pro Zelle
2. Die Primärschlüssel sind Abhängig voneinander - Jedes Nicht-Schlüsselattribut ist `voll funktional abhängig` von Primärschlüssel
3. Aus keinem Nicht-Schlüsselattribut folgt ein anderes Nicht-Schlüsselattribut
    - Jedes Nicht-Schlüsselattribut ist `nicht transitiv` vom Primärschlüssel `abhängig`.

## SQL
### Statements
- `SELECT` spalten `AS` alias `FROM` tabelle
    - `GROUP BY` spalte
        - Zusammenfassung von Zeilen, deren Wert in der angegebenen Spalte gleich ist
        - Abgesehen von der angegebenen Spalte sollten nur Funktionen als Spalten angegeben werden
    - `ORDER BY` spalte1, spalte2, ... ((`ASC` / `DESC`))
        - Zeilen werden nach ihren werten in den angegebenen Spalten sortiert
        - `ASC` = Aufsteigend
        - `DESC` = Abstiegend (Standard)
    - ((`LEFT`/`RIGHT`/`INNER`)) `JOIN` ... `ON` tabelle1.spalte1 = tabelle2.spalte2
        - Kombiniert 2 tabellen und gibt die spalten zurück in denen die `ON` Bedingung erfüllt ist oder die ein anderes Kriterium erfüllen
        - `INNER` = Gibt nur die Spalten zurück, die die Bedingung erfüllen
        - `LEFT (OUTER)` = Wie `INNER`, nur das egal ob die Bedingung erfüllt ist alle Spalten der 1. genannten Tabelle ausgegeben werden
        - `RIGHT (OUTER)` = Wie `INNER`, nur das egal ob die Bedingung erfüllt ist alle Spalten der 2. genannten Tabelle ausgegeben werden
        - `FULL (OUTER)` = Alle Spalten werden ausgegeben
    - `UNION`
        - Setzt die jede n-te Spalte der 2. Tabelle unter die n-te Spalte der 1. Tabelle
        - Standardmäßig werden doppelte Zeilen rausgefiltert
            - kann durch `UNION ALL` deaktiviert werden

- `DELETE FROM` tabelle `WHERE` bedingung
    - Das WHERE statement kann auch weggelassen werden, dann werden einfach alle einträge der tabelle gelöscht

- `INSERT INTO` tabelle (spalte1, spalte2, ...) `VALUES` (wert1, wert2, ...)

- `UPDATE` tabelle `SET` spalte1 = wert1, spalte2 = wert2, ... `WHERE` bedingung
    - Das WHERE statement kann auch weggelassen werden, dann werden die operationen auf alle werte ausgeführt

### Besondere Vergleichsoperatoren
Beispiel | Beschreibung
-------- | ------------
a `<>` b | Ungleich
a `LIKE` b | Pattern Matching (% = egal wie viele undefinierte chars | _ = 1 undefinierter Char)
a `BETWEEN` b `AND` c | Testet ob `a` in der range von `b` - `c` ist
a `IN` (geschachtelte SQL abfrage) | Testet ob `a` in den Ergebnissen der geschachtelten Abfrage ist
a `IS` `NULL` | Testet ob der `a` nicht definiert ist

### Funktionen
Funktionsname | Beschreibung
------------- | ------------
`COUNT` | Gibt die Anzahl der Zeilen wieder
`SUM` | Gibt die Summe aller werte einer Spalte wieder
`MAX` | Gibt den Minimalwert in einer Spalte wieder
`MIN` | Gibt den Maximalwert in einer Spalte wieder
`AVG` | Gibt den Durchschnittswert einer Spalte wieder
Kommt noch