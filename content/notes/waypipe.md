+++
title = "Waypipe: graphical remote access for Wayland applications"
date = 2025-05-28T19:29:14-03:00
+++

Tried out [Waypipe](https://gitlab.freedesktop.org/mstoeckl/waypipe) today as a way to remotely control graphical Wayland applications between Alpine Linux and FreeBSD hosts and it's snappy on my wireless network + decade-old hardware combo!

At first, the minimal example given by Waypipe in its README and man page did not work:

```shell
waypipe ssh user@server foot
```

<small>_(I'm using [foot](https://codeberg.org/dnkl/foot) as the example here because that's the terminal I use on both systems, but it could be anything --- a simplistic application, a web browser or even a full-blown compositor)._</small>

This failed with the following message:

    S2874:  0.603209 [src/server.c:649] Env. var XDG_RUNTIME_DIR not available, cannot place display socket for WAYLAND_DISPLAY="wayland-HBTrV7VT"

The issue here is that most (all?) Wayland applications expect at least `XDG_RUNTIME_DIR` to be set, and a bare ssh connection will not set that on its own.

The man page does mention this and how to fix it. It gives you several options, one of which is using `~/.ssh/environment` and setting it up properly at the [client](https://man.openbsd.org/ssh#USER) and [server](https://man.openbsd.org/sshd_config.5#PermitUserEnvironment).

Instead, I prefer to use the following approach because it's isolated to each host instead:

Client `~/.ssh/config`:

```ssh_config
Host <server>
    User <user>
    SetEnv XDG_RUNTIME_DIR=<user-writable-directory>
```

The directory above must exist prior to the connection and must be writable by the user as whom we will ssh into the server. Otherwise, it will throw the following error:

    S2889: 60.436704 [src/util.c:237] Error opening folder in which to connect to socket: Permission denied

If you'd rather reuse the `XDG_RUNTIME_DIR` value you already have set on the client, you can also use `SendEnv` instead of `SetEnv`, but their values may not be interchangeable. In my case, Alpine and FreeBSD use different directories with different permissions. This is one other advantage of this method over `~/.ssh/environment`.

Next, you need to make sure the server will allow the client to send this environment variable.

Server `/etc/ssh/sshd_config`:

```sshd_config
AcceptEnv XDG_RUNTIME_DIR
```

Make sure you have Waypipe installed on both server and client. Finally, from the client's shell:

```shell
waypipe ssh user@server foot
```

That's it! If all went well, a window should pop up with `foot` --- or whatever command you chose --- running directly from the server.

