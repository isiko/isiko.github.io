---
title: "Automatentheorie"
date: 2022-03-07T00:00:00+01:00
draft: false
authorTwitter: "isi_ko404"
tags: ["school", "computer-science", "Automate", "formale Sprachen"]
keywords: ["abitur", "a-levels", "computer-science", "Informatik"]
description: "Hier gehts um Formale Sprachen und die Automaten die sie erkennen"
showFullContent: false
readingTime: false
---


# Formale Sprachen und Grammatiken

`A` sei ein Alphabet. Eine endlich Folge von Zeichen ∈ A heißt `Wort`. Das `leere Wort` `ε` besteht aus null Zeichen. `A*` ist die Menge aller *endlich* langer Wörter über A. Jede Teilmenge `L` von `A*`heißt `formale Sprache` über dem Alphabet `A`.

Schriftlich sähe das dann so aus:

> A = {0|1}     x = 01101

## Grammatiken
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

## Chomsky-Hierarchie
Chomsky und Schützenberg definierten eine Hierachie der Formalen Sprachen. Es gibt 4 Stufen, wobei die unterste (Typ 0) jegliche Sprachen umfasst. Jede sprache des Typs n ist auch teil des Typs n-1. Je höher der Typ, dessdo einfacher zu erkennen sind die Sprachen

Typ | Name | Beschreibung | Benötigte Technik
--- | ---- | ------------ | -----------------
0 | allgemeine Chomsky Grammatik | alle Formalen Grammatiken | Turing Maschiene
1 | kontextsensitive Grammatik | Nonterminale müssen durch zeichen ersetztwerden. Nur das leere Wort ist zugelassen | Turing Maschiene
2 | kontextfreie Grammatik | Jede Produktionsregel hat als Input nur genau ein Nonterminal | Kellerautomat
3 | Reguläre Grammatiken | Jede Produktionsregel muss als output nur genau 1 Terminal haben, und nur wenn das Terminal nicht `ε` ist darf auch ein Nonterminal dabei sein. | DEA / NEA

### Reguläre Sprachen
Reguläre Sprachen können entweder `linkslinear` oder `rechtslinear` sein. `Rechtslineare` Sprachen werden auch als `reguläre` Sprachen bezeichnet

# Automaten
- Erhält Wort als Eingabe und gibt zurück ob er das Wort Akzeptiert oder nicht 
    - -> auch `Akzeptor` genannt
- Menge der vom Automaten akzeptierten Wörter -> vom Automaten Definierte Sprache
    - Durch endliche Automaten erkannte Sprachen sind Regulär (Also Typ-3)
    - Durch Kellerautomaten erkannte Sprachen sind Kontext-Frei (Also Typ-2)
- Besteht aus mehereren Zuständen und übergängen zwischen de
    - Vergleichbar mit `Non-Terminalen` und `Produktionsregeln` der Grammatiken
    - Können als Graph oder Tabelle verschriftlicht werden
## DEA (Determinitstischer Endlicher Automat)
- Pro Wort gibt es nur einen Weg der durch den Automaten genommen werden kann
- Wird als 5-Tupel geschrieben
- `ε` ist als Vokabel NICHT erlaubt

### Darstellung
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

## NEA
- Pro Wort kann es mehrere Wege durch den Automaten geben
- Wird genau wie ein DEA aufgeschrieben
- `ε` ist als Vokabel erlaubt
    - So kann ohne ein Zeichen des Eingabewortes abzuarbeiten der Zustand gewechselt werden

> Jeder NEA kann theoretisch in einen DEA umgewandelt werden, das funktioniert mithilfe der Potenzmengen-Konstruktion

## NKA (Nichtdeteministischer Kellerautomat)
Ein Kellerautomat ist wie ein normaler NEA, nur das nun auch noch ein Stack verwendet werden kann. D.h. das nun für jeden Übergang nicht nur das nächste Zeichen des Eingabewortes wichtig ist, sondern auch das oberste Zeichen im Stack.

### Darstellung
#### Automat
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

#### Übergänge
Übergänge müssen nun als Tripel angegeben werden, da es nun 3 statt 2 Variablen gibt.
> (X, p): YZ

Bezeichnung | Beispiel | Beschreibung
----------- | -------- | ------------
Oberstes Kellersymbol | X | Wird gelesen und entfernt
Eingabesymbol | p | Dieser wert ist schon vom DEA/NEA bekannt; er gibt das nächste Zeichen des Eingabewortes an
Zu schreibende Kellersymbole | ε oder XY | Angabe was auf den Stack gepusht wird. falls nichts gepushed werden soll wird hier `ε` angegeben

# Implementation
## Parser
- Implementation eines Automaten
- Zeichen des Eingabe Wortes werden nach einander gelesen
    - Die dauer zwischen den lesevorgängen ist egal, der Nuter kann z.B. auch die erste Hälfte des Wortes eingeben, sich einen Kaffe holen und dann erst den Rest eingeben
- Zustand des Automaten zu jedem Zeitpunkt abfragbar (Nicht akzeptierend / Aktzeptierend)

### Beispiel Implementation:
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

## Interpreter
- Implementation einer Grammatik
- Das Eingabe Wort wird als ganzes gelesen und dann via Methoden aufrufen geprüft
- Sofortige antwort
    - normalerweise boolscher Wert

### Beispiel Implementation:
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

# Möglichkeiten und Grenzen von Automaten und formalen Sprachen
Kommt noch