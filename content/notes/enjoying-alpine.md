+++
title = "Enjoying Alpine as a daily driver"
date = 2025-02-23T22:07:09-03:00
+++

I am happy to report that my Alpine root-on-ZFS experiment is -- apparently -- a success. I've been running it as my only OS on my laptop for the past week.

I was previously on Void and I switched because the stable part in "rolling but stable" wasn't really fulfilling what I expected, with occasional breakage on updates, or just things changing too often. For instance, every minor Python version you get a bump and every Python program on your system starts yelling deprecation warnings amid their output. I just can't with this rate of change of fundamental stuff like compilers and interpreters.

My favorite model of update is FreeBSD's. Your core system updates in one way, the third-party packages update another way, the core only updates if necessary and packages not too often as to introduce such breakage. But for this machine FreeBSD is just not there (yet).

Alpine updates every six months and it can be made as rolling as setting your Debian repositories to "stable" or "testing" ("edge" in Alpine) if you appreciate chaos enough.

It's my first time daily driving OpenRC and musl, which I feared would introduce painful compatibility issues, but so far I've been able to use everything I need, sometimes leveraging the [alternatives](https://wiki.alpinelinux.org/wiki/Running_glibc_programs), like its glibc compatibility layer or a Flatpak as last resort (e.g. for playing DRM video).

I started drafting a blog post with the journey so far, but I'll keep using it and hitting some more of my use cases along the way to have a more complete write-up.
