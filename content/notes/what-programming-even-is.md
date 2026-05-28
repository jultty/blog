+++
title = "A poet and a scientist on what programming even is"
date = "2026-05-27T13:13:22-03:00"

[taxonomies]
tags = [ "programming" ]
+++

I was reading this piece, [_I am not a Software Engineer_](https://huronbikes.mataroa.blog/blog/i-am-not-a-software-engineer/) by Andrew Golding, and had just skimmed through Peter Naur's [_Programming as Theory Building_](https://gwern.net/doc/cs/algorithm/1985-naur.pdf). The two immediately connected in my mind, both eloquent and poignant in different ways.

The author says they're not a software engineer. Perhaps a poet? There is a certain cadence and symbology going on, a certain feeling expressed and reflection on the meaning of more than a few words. My own poet's heart could feel it. It's not a rehash of "programmers are not engineers", it's actually setting the term aside for what perhaps it always meant, or came to mean, accurate or not per a dictionary.

If software engineering is making code spit itself and not even care what or how it's spitting, it still would likely offend any engineer to call it as such, but then it might also drift from what the converted ex-programmer signed up for.

I've personally always preferred the term _programmer_, which I suppose the LinkedIn Software Engineer would consider merely the act of writing code. This seems to miss the mark even if you go back several years, with Naur here defining it as "the whole activity of design and implementation of programmed solutions" in 1985. That makes you ask, then, what _is_ software engineering and if you try the "official" route you'll read things like "sound engineering principles" (Sommerville) and "systematic, disciplined, quantifiable" (IEEE), but the actual trend is moving farther and farther away from this ideal. At its core, it is still "design and implementation", with the notion of its distinctive feature being rigor having historically failed and now become laughable.

But what if even programming had never been _just_ design and implementation of computer programs?

Naur strikes at the core of it:

> programming properly should be regarded as an activity by which the programmers form or achieve a certain kind of insight, a theory, of the matters at hand. This suggestion is in contrast to what appears to be a more common notion, that programming should be regarded as a production of a program and certain other texts.

He then goes on to describe what he means by _theory_:

> What characterizes intellectual activity, over and beyond activity that is merely intelligent, is the person’s building and having a theory, where theory is understood as the knowledge a person must have in order not only to do certain things intelligently but also to explain them, to answer queries about them, to argue about them, and so forth.

Naur goes on and explains that what he means by _theory_ is not merely knowing the hard rules, but being able to understand how the rules apply to different phenomena of the real world in ways that may not be explicit in the general form of the theory. He closes this thought with a striking metaphor:

> [...] the knowledge held by someone who has the theory could not, in principle, be expressed in terms of rules. In fact, the similarities in question are not, and cannot be, expressed in terms of criteria, no more than the similarities of many other kinds of objects, such as human faces, tunes, or tastes of wine, can be thus expressed.

After a section on change, in which there is also the interesting remark that change without understanding of the program's theory will cause the decay of the program, Naur's next section, also poetically called _"Program Life, Death and Revival"_, we find this:

> The death of a program happens when the programmer team possessing its theory is dissolved.

In this same section, he goes into how to properly do some programming necromancy, cautioning that trying to revive a program without contact with its authors and its original theory can end up reviving it with a different theory. What a missed opportunity to call it the program's _spirit_, but alas, a serious computer scientist he was.

Naur's piece is philosophical, always making stops to ask what something _is_. If you are interested, it is [available in full here](https://gwern.net/doc/cs/algorithm/1985-naur.pdf). It's featured in his 1992 book, _Computing: A Human Activity_. I'll leave you with one last quote, from his closing remarks, in which Naur pushes back on the notion that humans work better when they have their intellects confined:

> [...] current discussion of programming seems to assume that programming is similar to industrial production, the programmer being regarded as a component of that production, a component that has to be controlled by rules of procedure and which can be replaced easily. Another related view is that human beings perform best if they act like machines, by following rules, with a consequent stress on formal modes of expression, which make it possible to formulate certain arguments in terms of rules of formal manipulation. Such views agree well with the notion, seemingly common among persons working with computers, that the human mind works like a computer. At the level of industrial management these views support treating programmers as workers of fairly low responsibility, and only brief education. On the Theory Building View the primary result of the programming activity is the theory held by the programmers. Since this theory by its very nature is part of the mental possession of each programmer, it follows that the notion of the programmer as an easily replaceable component in the program production activity has to be abandoned. Instead the programmer must be regarded as a responsible developer and manager of the activity in which the computer is a part.

