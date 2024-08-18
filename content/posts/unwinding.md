+++
title = "Giving up simplicity"
date = 2024-08-10
aliases = ["posts/unwinding.html"]
+++

_or_

# Unwinding

Due to a worker strike, the university semester ended late this year. That meant everything had to be compressed into little more than a month in order to wrap up what would have taken four. Now that we're almost through it, my mind wanders to writing. It is almost always what springs from the void in me, what has been winded up loosens and the scattered meaning starts to recollect into the drain of language and swirl through the piping of my nervous system.

_Wind_ is air that has been somehow compressed. If there was no pressure pushing it anywhere, it would be just expansive air, floating in peace with the atmosphere.

If you'd entertain this thought further, consider a work of visual art. It can be more figurative, clearly depicting shapes that mean something, and therefore able to convey an array of ideas to whatever extent of detail the artist wants. Conversely, it can be more abstract, where ideas will be a lot more sparse, possibly to the point where nothing at all is conveyed other than the appearance, whatever aesthetic is employed being the whole message in itself. Very little is packed into the work, just like the air you can't even feel weighing on you.

In computing, and more specifically in the realm of programming -- a craft presently overshadowed by the semantically starved jargon of whatever the department responsible for inflating public perception numbers is called these days -- simplicity is often emphasized. Code is supposed to be clear, expressive and clean. A software application is supposed to have as few dependencies as possible, and strive to keep it simple, or risk stupidity.

While that is a lofty goal, and while clear, expressive and clean code is a refreshing and tranquilizing sight, more often than not software just can't be simple.

Not having dependencies means implementing more and more yourself. There are corner cases to cover, tests to run, different architectures and operating systems to support. Even the simplest of software ideas, say, a calculator, a program that prints back a sentence in reverse, that displays a picture you give it, whatever you conceive as the simplest use case, is hardly ever implemented with simplicity in the naïve sense of something that is, quite literally, simplistic.

More often than not, simplicity is actually abstraction. The breaking apart of complexity behind a simpler facade. More so a way to manage complexity by conveying it simply than to enact simplicity in its actual sense. Each step in abstraction is actually a layer deeper into intricacy. And yet, it makes things immensely easier to manage and understand.

For some reason, I have always felt very drawn to abstract works. Staring into them, there is no expectation to understand, get, or argue about. Interestingly, to me that also means they couldn't be any more clear. It does not mean a specific, intelligible message is conveyed from the artist to me, rather, it means whatever impression is caused on the viewer was never intended to reach too deep anyways. It never intended to carry that much through its medium.

Sometimes, too much detail, no matter how specific, can draw an idea so far out that it becomes harder and harder to grasp. In contrast to that, a brisk exposition can get the message across like lightning.

So detail does not always convey meaning, although it can convey a specific meaning to someone who will bear with you as you build the context for it. Otherwise, you could convey your message just as effectively in an abstract manner if your receiver already has that context from the outset.

In computing, such possibility is simply absent from us. No context whatsoever can be assumed, and if it is present, that is because some other structure is providing it.

Complexity produces confusion, confusion produces frustration, and frustration can lead to either surrender or a rebound. So the interesting thing about this pressurizing of ideas is that it springs back into action a process that may reverse it or deflect into something else entirely. 

Instead of surrendering to the frustration of complexity, sometimes I actually take the time to recollect myself and analyze it into understanding. This feeling of winning over something that had me on my knees and ready to give up is a very gratifying one. It convinces me I can squeeze grit from despair if I bet on it and willingly risk desperation in order to see it through.

Yet, after chasing the deadline of effort all of it relaxes back into this state. In it, the only way to rest is to embrace complexity as the whole, and simplicity as one of its manifestations. It is so cold right now in the south, but in the north it is not. Four days and nine hours ago it was the peak of the winter. I'm wrapped in blankets and the room is dark like the depths of a submarine cave, LED lights here and there like fluorescent eyes blinking in silence.

The professor had us build games and then present them to the whole faculty. Among the outputs, one algorithm I produced stuck with me for what I deem is simplicity. It is responsible for causing an enemy to chase the player by finding the difference between their positions and lowering it:

```Python
func move_to(x, y):
	var x_difference = self.global_position.x - x
	var y_difference = self.global_position.y - y
	
	if abs(x_difference) > chase_speed:
		if x_difference > 0:
			self.global_position.x -= chase_speed
		else:
			self.global_position.x += chase_speed
	else:
		self.global_position.x += x_difference

	if abs(y_difference) > chase_speed:
		if y_difference > 0:
			self.global_position.y -= chase_speed
		else:
			self.global_position.y += chase_speed
	else:
		self.global_position.y += y_difference
```

It could be further abstracted. The logic is repetitive. The math could be condensed. But should it? Would that make it harder or easier to understand? And to whom? There is no single answer, and yet I would really appreciate knowing.
