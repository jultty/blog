+++
title = "A 2026 survey of Linux music players"
date = "2026-05-16T20:28:09-03:00"

[taxonomies]
tags = [ "software", "music", "linux" ]
+++

In composing this list, I was looking for a player with:

- Queue controls
- Library search and filtering
- Tray icon
- MPRIs
- Scrobbling to both ListenBrainz and Libre.fm would be nice to have

## Best GUI players

[fooyin](https://github.com/fooyin/fooyin) and [Quod Libet](https://quodlibet.readthedocs.io/).

fooyin is (clearly) heavily inspired by [foobar2000](https://www.foobar2000.org/), but FOSS and available for Linux. I've used foobar2000 a lot in my Windows days, so it feels like home. It did crash a few times when clicking things, but it mostly sits in the back anyways.

Quod Libet is also very feature-packed. The tray icon did not show up on my system though.

## Best TUI clients

[cmus](https://cmus.github.io/) is perhaps the player I've used the most. Shoutout to [musikcube](https://github.com/clangen/musikcube), which looks better, is simpler to navigate, has nice search and filter capabilities that cmus lacks, but that has a single dealbreaker for me: the lack of a hotkey to append the selected track into the queue.

## MPD clients

[MPD](https://www.musicpd.org/) (Music Player Daemon) is the queen of music players and has a plethora of available clients: GUI, CLI, TUI, even specialty things like [bgm-mpd](https://git.sr.ht/~nytpu/bgm-mpd), a player that places random breaks between songs to emulate the experience of game soundtracks. Because MPD frees the client developers from having to implement a backend, they can focus on creating excellent frontends, and this yielded a diversity of options.

### GUI

This one was harder than I expected. On the outset, I found players that _look_ very complete, such as [Euphonica](https://github.com/htkhiem/euphonica). It could be my machine and its quirks, but I couldn't get it to find MPD. So I guess I did _not_ find a maximalist GUI MPD client? At least nothing to the level of the other picks in this list.

### TUI

I usually will say that I like TUI things because they favor a state of flow between activities. They compose well and you can do a lot without changing neither the application, nor the UI paradigm nor the input device. That's a lot of tunneling for my attention.

But, to be fair, a music player is something you use to make your selection, and then it gets out of your way and can go on for hours and hours. So it's not exactly a huge attention hog, particularly because nearly all of them come with keyboard shortcuts and MPRIS integration.

Nonetheless, there are plenty of TUI MPD clients, and the most frutiful lineage seems to have descended from MPD's own [ncmpc](https://www.musicpd.org/clients/ncmpc/), which inspired the venerable [ncmpcpp](https://rybczak.net/ncmpcpp/), which leads us to... ~ncmpcpprs~ [rmpc](https://rmpc.mierak.dev/overview/), which is a full-blown terminal junkie TUI for MPD.

### Honorable mention

An honorable mention is in order for [Ymuse](https://yktoo.com/en/software/ymuse/). As you can see from my top choices, I prefer my music players on the bulkier side with a lot of knobs and pulls. That's because if I want something simple, I'll probably reach for plain [mpv](https://mpv.io/) or [mpc](https://www.musicpd.org/doc/mpc/html/). But If you are looking for something simple, but polished, Ymuse is my recommendation to you. It has a queue, some filtering and is very light on resources.

## See also

- MPD's [own list of clients](https://www.musicpd.org/clients/)
- [mpris-scrobbler](https://man.sr.ht/~mariusor/mpris-tools/mpris-scrobbler/), [Multi-Scrobbler](https://docs.multi-scrobbler.app/): scrobbling from MPD to Libre.fm, ListenBrainz, Last.fm, ...
- [mpd-mpris](https://github.com/natsukagami/mpd-mpris) and [mpDris2](https://github.com/eonpatapon/mpDris2): lets your MPD talk to everything
