<div align="center">
  <a href="https://github.com/zwubs/betamine">
    <img src="https://raw.githubusercontent.com/zwubs/nbeet/main/images/betamine.png" alt="betamine logo" width="128" height="128">
  </a>

  <h1 align="center" style="margin-bottom: 0; margin-top: 1rem;">betamine</h1>

  <p align="center">A Minecraft server written in Gleam</p>

</div>

## About
`betamine` is a Minecraft server written from the ground up in Gleam.
It utilizes the [`glisten`](https://hex.pm/packages/glisten) package as the basis for it's TCP connection.
The protocol utilized by `betamine` is documented on the [`wiki.vg`](https://wiki.vg/Protocol) website, which is a great resource if you're interested in getting into the networking side of Minecraft development.

<br>

> [!WARNING]
> Heads up, `betamine` currently lacks the security features that should be employed by a typical Minecraft server.
> Please refrain from utilizing `betamine` as a typical Minecraft server, for now it's sole purpose is education and fun.

## Getting Started

First things first you'll need to pull down the repository and get it running, you can do so with the following commands:

```sh
git clone git@github.com:zwubs/betamine.git
cd betamine
gleam run
```

Once running this will start up the server on `localhost` with the port `25565` (the default Minecraft server port), which you'll be able to connect to through your Minecraft client.

### Caveats
- I've had some issues getting this to work on Windows, if anyone has any ideas I'd love to hear them!
- I need to improve the pinging logic for the server. If you're having trouble seeing the server on your list after you add it, hitting the "Refresh" button a few times seems to help...

## Roadmap

This project is in an extremely alpha phase, so there's a lot that needs to be added to this project.
Also, this project is mostly just for fun, so I have no dates planned for features.
But, Here's a small breakdown of some of the things that are on my mind for the future:

- Chat Support
- Multiplayer Support
- Compression
- Microsoft Authentication
