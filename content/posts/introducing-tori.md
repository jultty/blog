+++
title = "Introducing tori"
date = 2024-06-30
aliases = ["posts/introducing-tori.html"]
+++

**[tori](https://tori.jutty.dev/)** is a tool to track your personal systems' configurations and replicate them. 

For the past 5 months, I've been simultaneously using and writing it to manage my main machine's configuration. By "manage the configuration" what I mean is keeping track of installed packages, configuration files, symlinks, and other settings that can be queried and set through command line interfaces.

After installing a given system, I wanted to get it to the same configuration state I was used to, or to a certain configuration specific to its purpose. Just copying backups would certainly be a very manual task, namely because:

- Not all settings live in `/etc`
- Some settings must be set using a specific CLI utility
- Backups usually carry an overwhelming amount of redundant default configuration you never even touched
- It does not track what is changing as you are still using the system
- I actually wanted to _know_ what I was tracking

Configuring a system can become a very vague process as you start to lose track of where the changes are being made and what is the specific configuration needed for something to work.

Every time you change some configuration file, every time you create a symlink somewhere, that's all having effects on the system that you may expect to be there in the future, but you may not remember how to accomplish that. This drift between what you have and what you are able to replicate only grows as you keep using your system.

To get a better idea, see the code snippet below. It's from the main file that I use to manage all function calls:

```sh
  xbps_get_many packages

  check_service dbus
  check_group audio
  check_group video

  copy dhcpcd.conf /etc/dhcpcd.conf
  place kernel-cmd-line.conf /etc/dracut.conf.d
  check_link /etc/localtime /usr/share/zoneinfo/America/Sao_Paulo

  get_nix tailspin tspin
  get_cargo taplo-cli taplo --locked
  get_bun bash-language-server
  get_bin 'https://raw.githubusercontent.com/hackerb9/lsix/master/lsix' lsix

  check_gsettings gtk-theme 'Plata-Noir'
  check_gsettings font-name 'Mononoki Nerd Font Regular'
```

What is happening here:

1. A file named `packages` containing package names is parsed and all packages are queried and installed by the `xbps` package manager, if not already installed
1. Service `dbus` is enabled if not already enabled
1. The user is added to groups `audio` and `video`, unless already in them
1. File `dhcpcd.conf` from the configuration directory's `base` directory is checked against the one in the passed path and overwrites it if the user chooses to do so
1. File `kernel-cmd-line.conf` from the configuration directory's `base` directory is copied into the passed path. If the file already exists or differs, tori will present an error
1. A symlink is checked to be on `/etc/localtime` pointing to the passed path. If it doesn't, it is created or fixed
1. If not installed, a few packages are installed using different package managers: `tailspin`, `taplo` and `bash-language-server`
1. If absent, an executable for `lsix` is downloaded from a URL and placed at `~/.local/bin`
1. Some `gsettings` values are read and set if they differ: `gtk-theme` and `font-name`

Notice how everything is conditioned to the system not already presenting that state? tori aims to be idempotent. Running it twice should do nothing the second time it runs so you can run it multiple times while making changes without any doubled effects.

I mentioned a `base` directory. This is what a sample tori directory would look like in its present state:

```
.
├── base
│   ├── dhcpcd.conf
│   ├── kernel-cmd-line.conf
│   ├── packages
│   └── vars.sh
├── .bkp
│   ├── canonical
│   │   ├── etc
│   │   └── opt
│   └── ephemeral
│       └── etc
├── src
│   ├── checks.sh
│   ├── copy.sh
│   └── get.sh
└── strap
```

What you are seeing in this sample of the directory are the following files and directories:

- `base`: Where you place the configuration files that functions like `copy` and `place` will look for and copy into the desired locations
- `.bkp/canonical`: Where tori will look for initial backups and create them if none exists
- `.bkp/ephemeral`: Where tori will place timestamped backups every time a file is modified or overwritten
- `src`: Where the source files live, mostly containing function definitions
- `strap`: The main file used to call the functions

Because I developed tori for my own purposes initially, I didn't really care to separate the actual source files from the context-sensitive data. While a mistake from a higher level, it allowed me to just keep developing the whole system configuration and the code that tracked it from a single, version-controlled location, amounting to very little complexity. I can't deny to have enjoyed it so far, but going forward that is going to change.

Currently, tori is able to install several package managers and their packages, including xbps, apt, nix, opam, stack, cargo, go, sdkmanager, npm, flatpak and pipx.

It can also perform several other tasks:

- setup programming runtimes for OCaml, Scala (via Coursier), Go, JavaScript (node and bun), Rust (via rustup)
- generate GPG certificates
- query and set options with `update-alternatives` and `gsettings`
- change the user shell
- check and enable services (systemd and runit)
- download pre-built binaries from tarballs and (g)zip files, unpacking and making them executable
- get files through the network using rsync
- several other things likely not worth mentioning

The application slowly grew to accommodate many of my needs, but I also made it very hard to share with the world in the process, since I never really meant to go public with it.

## Portability issues

Despite it being very useful to me in its current state and still being something I actively use every day, a lot of it is hard-coded for my very personal use. It was not written with portability in mind and therefore requires a lot of source-code editing to use in a different system.

For instance, when I switched from Debian to Void Linux, most of it broke. I certainly would not expect the package list to be compatible between them, but I realized at that point how tightly it was coupled to Debian.

When I started delving deeper into FreeBSD and setting up the system, I kept reaching out to something like tori. But it wasn't there, and it wouldn't work even if it were.

Something that certainly influenced my desire to write tori was my experience using NixOS, which was full of mixed feelings, but undeniably had good feelings that stuck.

 I really liked being able to manage the system configuration and packages from a single file. But, at the same time, I felt it was overkill. It was limiting because most of the time you were **forced** to configure things through its interfaces. It was basically incompatible with what every other Unix system expects, and therefore what people who write software for these systems also expect.

I appreciated bringing the system configuration to a centralized file, but I certainly did not want to manage all my `~/.config` configuration files from that same place. After writing tori, I can choose what to place under its tracking and what not to. Third-party software still works as both me and its creators expect it to, instead of my system breaking things and needing them to work the way _it_ expects.

## Glad to reinvent the wheel

While I understand there are very mature and powerful tools to manage a system's state and reproduce it, I am aiming here for a much simpler use case. I have no intention to see it used in enterprise or distributed systems. It is all about managing how your personal computing is set up and having a backup of how you did it.

What I need is not a tool that can orchestrate a fleet of containers running a given configuration. What I need is a tool that can run in a bare system that just got installed and get it to a state that feels useful to me. I do not want it to run instructions over a range of IPs, I just want to be able to check at any time if the system state has diverged from the configuration I am using to track it. I wanted a tool that would help me develop a different habit when I need to make system-level changes.

And finally, I suppose I just really wanted to build this. I really enjoy the process of configuring operating systems and learning how they work and differ. And I really wanted to learn more about portable, POSIX-compatible shell scripting.

So I decided to rewrite it with portability in mind. I am doing this rewrite in FreeBSD, to put the portability to the test. Once some basic functionality is done, the next step will be bringing it to Void Linux, Debian and NetBSD.

tori is a bird that has just hatched, so everything is still very, very crude. At this stage, the docs often show intentions rather than implemented functionality. Still, because it is something I've come to depend on, it has this rewarding sense of usefulness behind it.

If it sounds interesting to you, take a look. You can follow development at the main [Git repository](https://brew.bsd.cafe/jutty/tori) in BSD.Cafe's Git forge or through its mirrors on [GitHub](https://github.com/jultty/tori) and [Codeberg](https://codeberg.org/jutty/tori). Going forward, I will also probably be talking a lot about it on my [Mastodon profile](https://mastodon.bsd.cafe/@jutty).

