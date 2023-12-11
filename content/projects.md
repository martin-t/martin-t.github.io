+++
title = "Projects"
+++

FOSS stuff I work on. Join the [Rusty Games discord](https://discord.gg/gB9mNdQN5a) for updates and more.

## RustCycles

[RustCycles](https://github.com/rustcycles/rustcycles) is a game _and_ a genre-specific game engine for multiplayer shooters - an idea that's been thoroughly tested in Quake and Half-Life, yet so far is completely unknown in the emerging world of Rust gamedev. So I am here to change that.

First, RustCycles itself is a <sub>_liiiitle_ WIP</sub> fast-paced first-person multiplayer shooter. Except you're not a boring old guy walking around, you're driving a motorbike, you can't stop and you can't go in circles because you're leaving a force-field wall behind yourself. So you better come up with a plan fast before you crash. And you better think clearly under fire because other people are gonna be shooting at you. Know [Tron](https://www.youtube.com/watch?v=c1Eeu0lsozc&t=51s)? That, with guns.

Second, RustCycles is gonna be an engine by virtue of being _entirely_ moddable. Wanna build a shooter/RPG and looking for an engine? Use RustCycles. First by tweaking weapon balance or physics, that's already implemented just like in RecWars. Then add new characters, maps, weapons and vehicles declaratively - all assets will be automatically downloaded to clients who join your server. And finally, if that's not enough, the ultimate goal is to make all gamelogic moddable using WASM so gamelogic is downloaded from the server too and runs in a sandbox.

![RustCycles Gameplay](https://github.com/rustcycles/rustcycles/assets/4079823/5411df7a-6d31-482b-b3a0-ab3256f5280e)

## RecWars

[RecWars](https://github.com/martin-t/rec-wars) is a free and open source clone of RecWar, a 2D multiplayer tank shooter - 3 vehicle types, 8 weapons, 3 game modes and lots of maps. Still very WIP, but playable.

Originally started as a WASM browser game, later I ported it to Macroquad so it can run natively, now considering porting it to either comfy or Fyrox because Macroquad has issues. Or, maybe, I should work on the gameplay more first, then worry about making the technical side perfect.

![RecWars gameplay](https://raw.githubusercontent.com/martin-t/rec-wars/master/media/screenshot.jpg)

RecWars and RustCycles are developped in parallel because most people don't finish even one game so to make sure I fail, I am doing two at once. Jokes aside, the idea is to share the architecture and as much code as possible between them and use each one to learn lessons that can be applied to the other. So far, despite being in different engines and 2D vs 3D, it works well and it validates the idea that a given genre (like open source multiplayer shooters) can share 80% of the code developed by multiple devs together so that each person can then focus on the remaining 20% that makes their game unique.

## Cvars + consoles

[Cvars](https://crates.io/crates/cvars) is a Rust crate for managing configuration in games. Batteries included, so we have in-game consoles for the big Rust engines - Macroquad and Fyrox, with Egui planned to cover the rest. They're what powers the moddability in RecWars and RustCycles. Again, nothing exciting - everything's based on decades old tested and proven ideas from Quake and Half-Life ported to Rust.

<video src="https://user-images.githubusercontent.com/4079823/152082630-a705286d-c630-4507-9213-b8a7b106d47e.mp4" data-canonical-src="https://user-images.githubusercontent.com/4079823/152082630-a705286d-c630-4507-9213-b8a7b106d47e.mp4" controls="controls" muted="muted">Usage example video worth 15*1000 words per second</video>

![Macroquad console](https://github.com/martin-t/cvars/raw/HEAD/cvars-console-fyrox/screenshot.png)

![Fyrox console](https://github.com/martin-t/cvars/raw/HEAD/cvars-console-macroquad/screenshot.png)
