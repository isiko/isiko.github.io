---
title: "Led Cube"
date: 2022-01-12T10:57:42+01:00
draft: false
authorTwitter: "isi_ko404"
cover: ""
tags: ["led", "pcb", "maker", "arduino"]
keywords: ["led", "cube"]
description: "Last year I set out to build 4x4x4 LED cubes for my family as Christmas gifts. Now, in February, they are ready!"
showFullContent: false
readingTime: false
---

As everybody, I needed Christmas Presents for my Family last year. And as I consider my self a bit of a maker, I didn't want to just buy something. Also, I had seen some about building a LED Cube like the one on the Cover of this Post and thought that might be an interesting Idea for a present. Only Problem was: I didn't have much time to build them, let alone write some exciting Animations, and so instead of giving I could only promise a gift from me.

> As you are probably reading this: Sorry for that :/

But after New Year I finally found the time to start making, and in the following I will try to write a bit about it.

# How It works
Now, if you want to build your own LED Cube, you first have to think about a few things, the biggest question mark being, how to control all those LEDs. You need some kind of Computer to control them, and for these kinds of Projects you normally use Arduinos. These are small computers which don't have a lot of processing power, you wouldn't want to run any modern Operating System on these, but can be programmed to perform small and easy tasks. For example, they are often used in Smart Home applications where your focus mostly lies on measuring Data and not on performing big calculations. The only Problem is: They normally have 10-20 Pins at most, and my Cube uses 64 LEDs.

This seems pretty bad, but we can actually do some things to make more out of our limited amount of pins. First, we could turn on only one layer at a time. Using only one pin per Vertical line of LEDs, this would only need 16 Pins for the LEDs and 1 Pin for each layer, bringing our total required pin count down to 20. 

{{< figure src="https://content.instructables.com/ORIG/F7K/DAPC/FE7ITU7R/F7KDAPCFE7ITU7R.jpg?auto=webp&frame=1&width=557&height=1024&fit=bounds&md=8529fbd770d33b7399b9d7be1ce6537c" alt="Illustration of how to address the LEDs" position="center" caption="Borrowed this Picture from the article I was talking about earlier" >}}

This would be enough to handle for some Arduinos, but as this project really doesn't need that much processing power, I would rather use even fewer Pins. A simple solution to this would be `latches`, although there are different configurations of these that have their pros and cons. I could go into depth explaining what latches are and how you can build them, but all you need to know at this point is that they are a very basic form of temporary storage. A simple form of this is the `D-Type Latch`, which I used for this project. They have an Input-Input, a clock-input, one output and every time the clock pulses, the Input is copied to the output. When the Clock isn't active anymore, the output won't change. As you normally want more than one bit of storage, you see these often packaged into packages of some factor of 2, e.g. 2-Bits, 4-Bits, 8-Bits and so on. Another interesting use for latches are `shift-registers`. You can think of this as a couple of 1-Bit latches chained together, because if you connect all the clocks and link each output to the input of the next latch, everything you put in propagates along the chain. If you think about this, you basically have unlimited outputs while just using 2 Inputs. I hope this was understandable, if not: Just remember the last sentence, it is all you will need to know for this post.

> If that last paragraph was appealing to you, you might want to check out [Ben Eaters YouTube Channel](https://www.youtube.com/c/BenEater), for example he has a whole series about building a CPU on some breadboards.

Using these latches, you could think of two rather simple ways to address your pin-limitaion. Either we could use a 16-Bit shift-register or we could use 4 4-Bit latches to program each row before turning on the layer. For my Cubes, I used the second method, but that was just based on the fact that I just learned about shift-registers after I was done with my schematics. If you want to build a cube for yourself, I would suggest using the first method as it lets you have more inputs on your Processor with other stuff [e.g. buttons or even screens], although there is an argument to be made that this is probably a bit slower and might not work for bigger cubes.

# Schematics and PCB-Design
When we put all of this together, we get the following Schematics:

{{< figure src="/img/posts/ledCube.schematic.png" alt="The complete Schematics" position="center" caption="The Complete schematics" >}}

They might look a bit strange, for example the big box at the Bottom represents the LEDs, but this has a reason. As I try to learn something new with eatch project, I wanted to try and design a PCB for this one and because of that I was using Eagle for the schematics. Actually, I didn't just do this because of the learning factor, I also didn't want to deal with a jungle of jumper wires.

Although It might seem complicated at first, designing a PCB isn't actually that hard. In Eagle, each part is defined with a schematics-symbol and a footprint, so when you are done with your schematics you can switch to board-layout mode and eagle already shows you the footprint of each part and what pins should be connected. For simple boards like mine, you just have to organize them all on a board and then hit 'autoroute'. Eagle then generates a layout for the copper traces, and you'll probably just have to make some minor adjustments. The scary part comes when you actually order your board, because when you send your order, you have to wait a few weeks until you can hold the Results in your Hands and if you made a mistake you can't just 'fix it and rerun'. I actually checked every connection 5 times to make sure I didn't have an error.

I also used only through hole components and wanted to assemble the Boards my self, so after I ordered my PCBs I went over to Reichelt and ordered my components.

# Programming
This easily took the most effort. I've done a bit of Microcontroller Programming in the past, but I'm far from calling my self 'good'. The Code for displaying frames on the LEDs was actually quite simple, but figuring out how to split C++ code to multiple classes and files was much harder than I thought. You can see my results [here](https://github.com/isiko/LED-Cube). Also, as this is actually quite modular, if you also made a cube using the latch Method you could just copy my code, adjust the `vars.h` and flash the Project to your Microcontroller using PlatformIO.

> If you do so, please contact me, I would love to see what you achieved with it

Also, I should clarify again that I am not a good C++ programmer, so there are probably a few improvements to be made. Anyway, I created a Base class for the Animations, which made it possible to just define the animations in an Array, so if you want you can add your own [Just open a pull-request, I'll probably approve it].

## Test Animation
To have something to test the Cubes with, I started by adding a basic Animation that just flashes each LED, one after another. This makes it easy for me to spot if I made a mistake in the rest of the Code, although it doesn't look that interesting.

## Flash
In the Beginning I had a few Hardware Issues [mostly bad solder-spots] and as those normally effect more than one LED at a time, I added an Animation to flash all LEDs at a time. This shows for example if a complete Layer or Row somehow isn't turned on, with the previous test animation would just show nothing for a longer amount of time, which could also be explained with an error in my code.

## Layers
For fun and also to test the system, I added an animation which would show layers cutting the Cube, so nothing special.

## Moving Lines
The first exciting Animation I made was the `DirectLines` Animation. I wanted to have something wander from corner to corner in straight lines. I started by just having one LED, but when I had that down, I added a lifetime to them. Now, when the head moves, I give the Position it moves to a specific Value [for example 5]. This then decreases with each step, and only the Positions which have a value above 0 are turned on. In the end, this looks like a snake of lights is crawling from one corner of the cube to another. When I've built a bigger Cube, I might also add a version of this Animation that is not constrained to the corners, but with 'only' 64 LEDs that probably won't look that good.

## isi_ko's game of life
Conway's game of life is a 0 Player game, invented by English mathematician [John Horton Conway](https://en.wikipedia.org/wiki/John_Horton_Conway). The Board for his game consists of an infinite amount of Cells, which all can have 2 States: Dead or Alive. Each turn, all the Cells are updated at the same time, according to the following Rules:

1. Every dead Cell with exactly 3 life neighbors is resurrected.
2. Every alive Cell with 2-3 life neighbors survives
3. The Rest of the Cells die

Now you might ask, 'What fun is a game you can't play?' and the answer to that would actually be a bit complicated. As the game of life is something you can only observe, it normally is rather boring. But those simple 3 Rules allow for some interesting stuff, which I will try to explain in the following.

First, the Game of life is `turing-complete`, meaning you can emulate every possible `turing machine` with it. As every modern CPU can be theoretically reduced to a `turing machine`, this means that you could theoretically calculate everything computer calculable, using only these rules.

Also, you can find Creatures in the Math of this game. Now for the standard game of life that would be an overstatement, the 'creatures' or 'gliders' as they are called are basically just patterns that repeat themselves while also moving in some direction. But in a variation called `[Lenia](https://golden.com/wiki/Lenia)` you can find actual creatures which you could even call living.

This also probably is something that would be more exciting on a bigger Cube, but I also think that already with this small display I found some interesting formations.

Porting it to 3D wasn't actually that hard, it basically took me about 45 Minutes as I could actually copy some code from the lines animation. As in 3D space each Cell can have 26 instead of the normal 8 neighbors, I had to use different Values for the rules.

> Thanks to [Chris Evans](https://chrisevans9629.github.io/blog/2020/07/27/game-of-life) whos Values I endet up 'borrowing'

# Conclusion
So In the end it was quite a lot of fun building this and programming it, so if you are searching for a project maby give it a try. You can find instructions [here](https://www.instructables.com/LED-Cube-4x4x4/), although I ended up just using their Ideas for Multiplexing, so I don't know how good to follow it is. If I find the time I'll probably try to build a 8x8x8 Cube, so stay tuned as I'll probably also write about that.