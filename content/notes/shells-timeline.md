+++
title = "A timeline of Unix shells"
date = 2025-02-24T14:34:25-03:00
+++

For some reason, I really like timeline visualizations, meaning a graph with events listed along a temporal axis with the dates in which they happened. I remember using tape to glue several pieces of paper on the wall as a kid to make a long timeline of world history events.

So every time I find a tool to do that, I want to check it out. The latest was [Markwhen](https://markwhen.com/), which works entirely by defining the timeline as code and then running an executable against it to render image or interactive web outputs.

To try it out, I made this timeline of Unix shells. You can view [the HTML version here](https://jultty.github.io/shells-timeline/) or the images below (dark and light themes):

[![A timeline of Unix shells with events starting in 1963 and ending in 2020. Years are represented horizontally and events start from the top left towards the bottom right, forming a diagonal of events and their labels. Each event is represented by a dot, a date and a shell name. Foreground is white and gray, background is black.][dark]][dark]
[![The same timeline as in the previous picture, but with black and gray foreground and white background.][light]][light]

[dark]: /assets/img/posts/shells-timeline/shells-timeline_dark.png
[light]: /assets/img/posts/shells-timeline/shells-timeline_light.png

<details>
<summary>Expand for a textual list of the timeline events</summary>
<ul>
<li>1963: RUNCOM</li>
<li>1965: Multics shell</li>
<li>1971-11: Thompson shell (sh)</li>
<li>1977-07-01: PWB shell (sh)</li>
<li>1978: C shell (csh)</li>
<li>1979: Bourne shell (sh)</li>
<li>1983-10-04: TENEX C Shell (tcsh)</li>
<li>1983-06-09: KornShell (ksh)</li>
<li>1989-05-30: Almquist shell (ash)</li>
<li>1989-06-08: Bourne-Again Shell (bash)</li>
<li>1990-12-14: Z shell (zsh)</li>
<li>1992: Plan 9 Rc (rc)</li>
<li>1995-06-16: Public Domain KornShell (pdksh)</li>
<li>1997-06-19: Debian Almquist shell (dash)</li>
<li>2004-04-07: MirBSD Korn Shell (mksh)</li>
<li>2005: friendly interactive shell (fish)</li>
<li>2019-08-23: Nushell (nu)</li>
<li>2020-10-30: Portable OpenBSD KornShell (oksh)</li>
</ul>
</details>

Don't ask me why every item is followed by ..., I'd love to know.

If you are interested, [here is the source code](https://github.com/jultty/shells-timeline/blob/main/shells.mw) that was used to generate the images above. The source code also contains notes that are only displayed in the HTML version. These notes are sources for the dates and sometimes observations on the date precision.
