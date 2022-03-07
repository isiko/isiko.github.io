---
title: "Abitur - Computer Science"
date: 2022-03-01T00:00:00+01:00
draft: true
authorTwitter: "isi_ko404"
cover: "/img/covers/abitur.jpg"
tags: ["school"]
keywords: ["abitur", "a-levels", "computer-science", "Informatik"]
description: "I'm writing my A-Levels this year and here you can find my Notes for the Computer Science Test"
showFullContent: false
readingTime: false
---

> As I'm German and this is just for me and maby some of my classmates, I'll be writing in German here. 

> Dieser Post ist wahrscheinlich voller Rechtschreib Fehler, das liegt einfach daran das ich ihn an einem Nachmittag runter geschrieben habe ;D

# Daten und ihre Strukturierung
## Objekte und Klassen

### Diagramme
Es gibt verschiedene Arten von Diagrammen die in der Planung und instandhaltung von Programmen wichtig sind, und in NRW gibt es sogar nochmehr.

#### Objektdiagramm
- Beschreibt einen Zustand des Programms
    - Konkrete Werte für Attribute
    - keine Methoden
- Alle Objekte mit Runden Ecken
- Pfeile für Interaktionen zwischen den Objekten

#### Klassendiagramme
Alle Objekte müssen einer Klasse zugehören, wesshalb auch hierfür Diagramme notwendig sind.

##### Klassentypen
Klasse ist nicht unbedingt gleich Klasse, es gibt 2 wichtige Merkmale die sie aufweisen können:

- Interfaces
    - Interfaces haben keine Attribute
    - Methoden sind nur mit Methodenkopf angegeben
    - Es kann nicht dierekt ein Objekt von ihnen erstellt werden, nur ihre Unterklassen können instanziiert werden

##### Beziehungen
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

#### Entwurfsdiagramm
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

#### Implementationsdiagramm
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

#### Struktogramme
Kommt noch

### Lineare Strukturen
(Dokumentation wird in der Klausur bereitgestellt)
- Stack
- Queue
- List

### Nicht-Lineare Strukturen
(Dokumentation wird in der Klausur bereitgestellt)
- Binary Tree
- Binary Search Tree
- Graph

## Datenbanken
Datenbanken sind ein einfacher zentraler Massenspeicher der von mehreren Programmen gleichzeitig genutzt werden kann.
### Modelierung
Kommt noch

### Anomalien
Durch das verändern der Datenbank kann es sein das sie Fehlerhaft wird. Diese `Anomalien` können teilweise durch kluges Modelieren vermieden werden. Gegen mutwillige zerstörung hilft das aber auch nicht.
#### Arten
- Löschanomalien
- Eingügeanomalien
- Aktualisierungsanomalien
#### Normalisierung
1. Ein Wert pro Zelle
2. Die Primärschlüssel sind Abhängig voneinander - Jedes Nicht-Schlüsselattribut ist `voll funktional abhängig` von Primärschlüssel
3. Aus keinem Nicht-Schlüsselattribut folgt ein anderes Nicht-Schlüsselattribut
    - Jedes Nicht-Schlüsselattribut ist `nicht transitiv` vom Primärschlüssel `abhängig`.

### SQL
#### Statements
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

#### Besondere Vergleichsoperatoren
Beispiel | Beschreibung
-------- | ------------
a `<>` b | Ungleich
a `LIKE` b | Pattern Matching (% = egal wie viele undefinierte chars | _ = 1 undefinierter Char)
a `BETWEEN` b `AND` c | Testet ob `a` in der range von `b` - `c` ist
a `IN` (geschachtelte SQL abfrage) | Testet ob `a` in den Ergebnissen der geschachtelten Abfrage ist
a `IS` `NULL` | Testet ob der `a` nicht definiert ist

#### Funktionen
Funktionsname | Beschreibung
------------- | ------------
`COUNT` | Gibt die Anzahl der Zeilen wieder
`SUM` | Gibt die Summe aller werte einer Spalte wieder
`MAX` | Gibt den Minimalwert in einer Spalte wieder
`MIN` | Gibt den Maximalwert in einer Spalte wieder
`AVG` | Gibt den Durchschnittswert einer Spalte wieder

# Graphen Theorie
## Traversierung
Geht den ganzen Graphen ab. Kann auch zur Suche eines Knotens benutzt werden. Kann Theoretisch auch als Routenplaner verwendet werden

### Breiten Traversierung
Kommt noch
### Tiefen Traversierung
Kommt noch

## Minimal-Spanning Tree
Generiert eine Version des gegebenen Graphens, der alle Knoten umfasst, allerdings nur das absolute Minimum an Kanten enthält (nach Gewicht)

### Kruskal
1. Kanten nach Gewicht sortieren
2. Jede Kante Prüfen
    - Wenn durch das einsetzen der Kante in den neuen Graphen kein Kreis entsteht: einsetzten
    - Ansonsten Löschen
Bei einem getrennten Graphen wird auch der Output getrennt sein.

### Prim
1. Zufällige Startposition wählen und Markieren
2. Von allen Markierten Knoten die Günstigste Verbindung zu einem Nicht Markierten Knoten suchen und einsetzen
3. Schritt 2 solange wieder holen, bis alle Knoten Markiert sind
Bei einem Getrennten Graphen wird Prim irgendwann in einer Endlosschleife sein.

## Routenplanung
Noch kein Optimaler Algorithmus gefunden
### Dijkstra
1. Alle Allen Knoten den Abstand ∞ zu weisen
2. Dem Startknoten den Wert 0 zu weisen
3. den Startknoten zum aktuellen Knoten machen
4. Falls ein Nachbarknoten einen höheren Abstand als der Abstand des eigenen Knoten + das Kantengewicht zum NAchbarknoten hat, diesen Wert erneuern
5. Selbiges auch Umgekehrt ausführen
5. Den aktuellen Knoten Markieren
6. Falls der Aktuelle Knoten nicht das Ziel war, den nicht markierten Knoten der den niedrigsten Abstand hat zum Aktuellen Knoten machen. Ansonsten Abbrechen
7. Zurück zu Schritt 4



# Formale Sprachen und Automaten
## Formale Sprachen und Grammatiken

`A` sei ein Alphabet. Eine endlich Folge von Zeichen ∈ A heißt `Wort`. Das `leere Wort` `ε` besteht aus null Zeichen. `A*` ist die Menge aller *endlich* langer Wörter über A. Jede Teilmenge `L` von `A*`heißt `formale Sprache` über dem Alphabet `A`.

Schriftlich sähe das dann so aus:

> A = {0|1}     x = 01101

### Grammatiken
Grammatika sind Regeln nach denen Wörter Produziert werden können. Sie werden als 4-Tupel angegeben:

> G = (Vt, Vn, S, P)

Bezeichnung | Zeichen | Beispiel | Beschreibung
----------- | ------- | -------- | ------------
Terminalsymbole | Vt | {m, ä, h, !} | Das Alphabet aus dem später die Wörter gebildet werden. Terminale sind meist Kleinbuchstaben
Non-Terminalsymbole | Vn | {S, A, B} | Vergleichbar mit den Zuständen er Automaten. Nonterminale sind meist Großbuchstaben
Startsymbol |  | S | Vergleichbar mit dem Startzustand der Automaten
Produktionsregeln | P | | Ähnlich zu `d` bei den Automaten. Jedem Non-Terminalsymbol wird hier eine Kombination aus Terminal und Non-Terminalsymbolen zugewiesen, wobei weder noch zwingen notwendig sind

P kann wie folgt aufgeschrieben werden:

>S -> mAB!
>A -> ä | äA
>B -> h | hB

### Chomsky-Hierarchie
Chomsky und Schützenberg definierten eine Hierachie der Formalen Sprachen. Es gibt 4 Stufen, wobei die unterste (Typ 0) jegliche Sprachen umfasst. Jede sprache des Typs n ist auch teil des Typs n-1. Je höher der Typ, dessdo einfacher zu erkennen sind die Sprachen

Typ | Name | Beschreibung | Benötigte Technik
--- | ---- | ------------ | -----------------
0 | allgemeine Chomsky Grammatik | alle Formalen Grammatiken | Turing Maschiene
1 | kontextsensitive Grammatik | Nonterminale müssen durch zeichen ersetztwerden. Nur das leere Wort ist zugelassen | Turing Maschiene
2 | kontextfreie Grammatik | Jede Produktionsregel hat als Input nur genau ein Nonterminal | Kellerautomat
3 | Reguläre Grammatiken | Jede Produktionsregel muss als output nur genau 1 Terminal haben, und nur wenn das Terminal nicht `ε` ist darf auch ein Nonterminal dabei sein. | DEA / NEA

#### Reguläre Sprachen
Reguläre Sprachen können entweder `linkslinear` oder `rechtslinear` sein. `Rechtslineare` Sprachen werden auch als `reguläre` Sprachen bezeichnet

## Automaten
- Erhält Wort als Eingabe und gibt zurück ob er das Wort Akzeptiert oder nicht 
    - -> auch `Akzeptor` genannt
- Menge der vom Automaten akzeptierten Wörter -> vom Automaten Definierte Sprache
    - Durch endliche Automaten erkannte Sprachen sind Regulär (Also Typ-3)
    - Durch Kellerautomaten erkannte Sprachen sind Kontext-Frei (Also Typ-2)
- Besteht aus mehereren Zuständen und übergängen zwischen de
    - Vergleichbar mit `Non-Terminalen` und `Produktionsregeln` der Grammatiken
    - Können als Graph oder Tabelle verschriftlicht werden
### DEA (Determinitstischer Endlicher Automat)
- Pro Wort gibt es nur einen Weg der durch den Automaten genommen werden kann
- Wird als 5-Tupel geschrieben
- `ε` ist als Vokabel NICHT erlaubt

#### Darstellung
> M = (Z, A, d, q0, E)

Bezeichnung | Zeichen | Beispiel | Beschreibung
----------- | ------- | -------- | ------------
Zustandsmenge | Z | {q0, q1, q2, q3} | Eine Liste aller Zustände des Automaten (muss den Anfangszustand enthalten)
Eingabealphabet | A | {0,1} | Alle Zeichen die der Automat später verarbeiten können soll
Übergangsfunktion | d | |  Graph oder Übergangstabelle
Anfangszustand |  | q0 | Der Zustand bei dem die Eingabe beginnen soll
Menge der Endzustände | E | {q2, q3} | Eine Liste aller Zustände die später als akzeptierend gelten sollen

Um `d` tabellarisch darzustellen, muss jeder Übergang in eine Tabelle mit folgenden Spalten eingetragen werden:

- aktueller Zustand
- gelesenes Eingabesymbol
- Folgezustand

### NEA
- Pro Wort kann es mehrere Wege durch den Automaten geben
- Wird genau wie ein DEA aufgeschrieben
- `ε` ist als Vokabel erlaubt
    - So kann ohne ein Zeichen des Eingabewortes abzuarbeiten der Zustand gewechselt werden

> Jeder NEA kann theoretisch in einen DEA umgewandelt werden, das funktioniert mithilfe der Potenzmengen-Konstruktion

### NKA (Nichtdeteministischer Kellerautomat)
Ein Kellerautomat ist wie ein normaler NEA, nur das nun auch noch ein Stack verwendet werden kann. D.h. das nun für jeden Übergang nicht nur das nächste Zeichen des Eingabewortes wichtig ist, sondern auch das oberste Zeichen im Stack.

#### Darstellung
##### Automat
Anstelle eines 5-Tupels wird hier ein 7-Tupel verwendet um den Graphen darzustellen
> M = (Z, A, K, d, q0, #, E)

Bezeichnung | Zeichen | Beispiel | Beschreibung
----------- | ------- | -------- | ------------
Zustandsmenge | Z | {q0, q1, q2, q3} | siehe DEA
Eingabealphabet | A | {0,1} | siehe DEA
Kelleralphabet | K | {K, #} | Menge aller Zeichen die im Keller sein können. Das Kellerstartsymbol ist Teil des Kelleralphabets, aber `ε` kann nicht Teil werden
Übergangsfunktion | d |  |  siehe DEA
Anfangszustand |  | q0 | siehe DEA
Kellerstartsymbol | | # | beim Instanziieren ist nur dieses Zeichen im Keller
Menge der Endzustände | E | {q2, q3} | siehe DEA

Um `d` tabellarisch darzustellen, muss jeder Übergang in eine Tabelle mit folgenden Spalten eingetragen werden:

- aktueller Zustand
- gelesenes Eingabesymbol
- oberstes Kellersymbol
- Folgezustand
- zu schreibende Kellersymbole

##### Übergänge
Übergänge müssen nun als Tripel angegeben werden, da es nun 3 statt 2 Variablen gibt.
> (X, p): YZ

Bezeichnung | Beispiel | Beschreibung
----------- | -------- | ------------
Oberstes Kellersymbol | X | Wird gelesen und entfernt
Eingabesymbol | p | Dieser wert ist schon vom DEA/NEA bekannt; er gibt das nächste Zeichen des Eingabewortes an
Zu schreibende Kellersymbole | ε oder XY | Angabe was auf den Stack gepusht wird. falls nichts gepushed werden soll wird hier `ε` angegeben

## Implementation
### Parser
- Implementation eines Automaten
- Zeichen des Eingabe Wortes werden nach einander gelesen
    - Die dauer zwischen den lesevorgängen ist egal, der Nuter kann z.B. auch die erste Hälfte des Wortes eingeben, sich einen Kaffe holen und dann erst den Rest eingeben
- Zustand des Automaten zu jedem Zeitpunkt abfragbar (Nicht akzeptierend / Aktzeptierend)

#### Beispiel Implementation:
Dieser Parser simmuliert einen Automaten der die Lachsprache erkennt, d.h. alle Worte starten mit einem `h`, worauf sich `h`s und `a`s abwechseln, bis nach dem letzen `a` ein `!` kommt.
``` Java
public static void main(String[] args) {
    char eingabe = ' ';

    int[] K = {1,2,4,4};
    int start = 1;
    int[] endZustaende = {4};
    String alphabet = "ha!";

    int zustand = start;

    do {
        System.out.println("Aktueller Zustand: " + zustand);

        Scanner reader = new Scanner(System.in);
        eingabe = reader.next().charAt(0);

        switch (eingabe){
            case 'h':
                switch (zustand) {
                    case 1 -> zustand = 2;
                    case 3 -> zustand = 2;
                    default -> System.out.println("Nicht Valide");
                }
                break;
            case 'a':
                switch (zustand) {
                    case 2 -> zustand = 3;
                    default -> System.out.println("Nicht Valide");
                }
                break;
            case '!':
                switch (zustand) {
                    case 3 -> zustand = 4;
                    default -> System.out.println("Nicht Valide");
                }
                break;
        }

    } while (alphabet.contains(String.valueOf(eingabe)));
}
```

### Interpreter
- Implementation einer Grammatik
- Das Eingabe Wort wird als ganzes gelesen und dann via Methoden aufrufen geprüft
- Sofortige antwort
    - normalerweise boolscher Wert

#### Beispiel Implementation:
Dieser Interpreter erkennt die Schafsprache; Hier beginnt jedes Wort mit einem `M`, gefolgt von einer undefinierten Anzahl an `ä`s, gefolgt von einer undefinierten Anzahl an `h`s, gefolgt von einem `!`
```Java
public static void main(String[] args) {
    while (true){
        Scanner reader = new Scanner(System.in);
        System.out.println(checkS(reader.next()));
    }
}

private static boolean checkS(String e) {
    if (e.length()>0) {
        String rest = e.substring(1);
        switch (e.charAt(0)) {
            case 'M' -> {
                return checkZ1(rest);
            }
            default -> {
                return false;
            }
        }
    }
    return false;
}

private static boolean checkZ1(String e) {
    if (e.length()>0) {
        String rest = e.substring(1);
        switch (e.charAt(0)) {
            case 'ä' -> {
                return checkZ2(rest);
            }
            default -> {
                return false;
            }
        }
    }
    return false;
}

private static boolean checkZ2(String e) {
    if (e.length()>0) {
        String rest = e.substring(1);
        switch (e.charAt(0)) {
            case 'ä' -> {
                return checkZ2(rest);
            }
            case 'h' -> {
                return checkZ3(rest);
            }
            default -> {
                return false;
            }
        }
    }
    return false;
}

private static boolean checkZ3(String e) {
    if (e.length()>0) {
        String rest = e.substring(1);
        switch (e.charAt(0)) {
            case 'h' -> checkZ3(rest);
            case '!' -> {
                return e.length() == 1;
            }
            default -> {
                return false;
            }
        }
    }
    return false;
}
```

## Möglichkeiten und Grenzen von Automaten und formalen Sprachen

# Informatiksysteme (= Rechnernetze)
Kommt noch

# Informatik, Mensch und Geselschaft
## Grundprinzipien des Datenschutzes
- Verbot mit Erlaubnisvorbehalt
    - Datenverarbeitung grundsätzlich verboten, essei denn die Person hat zugestimmt
- Datenminimierung
    - Möglichst wenig Daten erheben / verarbeiten
    - Wenn möglich Pseudo- oder Anonymisieren
    - Daten löschen sobalt sie nicht mehr benötigt werden
- Zweckbindung
    - Die Daten dürfen nur für einen bestimmten Zweck verwendet werden
- Tranzparenz
    - Die Person deren Daten verarbeitet werden muss darüber Benachrichtig werden
    - Ausnahme Strafverfolgung
- Erforderlichkeit
    - Daten dürfen nur erhoben werden wenn sie auch benötigt werden oder sie etwas bedeutend einfacher machen