+++
title = "N simple tricks to reduce incremental compile times in Rust by X"
+++

## TL;DR

Go to [this section](#the-n-simple-tricks), add the 3 snippets to your config and you'll get around TODO faster rebuilds[^fine-print]. Seriously, it barely takes 5 minutes. Just do it and start a build. The first one will take longer (it rebuilds everything with the new configuration) so you'll have time to read the rest of the article. After that, incremental rebuilds should be very noticeably faster.

<!-- LATER summary -->

[^fine-print]: Fine print: on most projects. For example I had little success improving rebuild times for my proc-macro crate, though it has improved them for projects using the proc-macros.

## Terminology - full vs incremental

full vs incremental
    rust's incremental flag

Often I see people ~~complaining~~ talking about compile times in general and yes, both full and incremental are longer than we'd like, so it often makes sense to conflate the two. But when talking about improving them, people need to clarify which they mean because not all advice helps with both and often we only care about one or the other (e.g. incremental locally vs full on CI). In fact some ways to improve one worsen the other[^worsening]. Even when something improves both, the speedup numbers lose meaning if you conflate the two.

[^worsening]: That doesn't mean improving incremental has to make your CI builds worse, you can use separate build profiles.

This article uses "full" to mean a complete build of the project with all its dependencies - this is the first build after cloning a new repo or after changing some options in Cargo.toml[^cargo-toml]. Conversely, I use "incremental" for subsequent builds where only a few lines or files have changed.

[^cargo-toml]: Note that not all options cause a full rebuild when changed. For example when you change the opt-level of only the root crate, only the root crate is rebuilt.

## How to even measure

comment in beginning to change line numbers

change constants or field names

how rustc does it - diff files

Q: does changing back and forth reuse more cache than making the same change repeatedly?

compare touch main.rs vs comment to end of it, to beginnin, meaningful changes to multiple files (to change multiple CGUs)

The standard disclaimers when benchmarking apply:

- Look at CPU usage before starting, if it's not around 0% figure out what your coputer is doing and stop it.
- Don't do anyting else on the computer while benchmarking. (Note: Even listening to music in the background can skew some benchmarks by a couple percent. Probably not a concern here given the large speedups (we're hoping for) but it's good to keep in mind. On linux, also mind what's on other workspaces - e.g. a browser tab open on another workspace behaves as if it was in the foreground.)
- It's best to close your editor - the benchmarks edit

## The N simple tricks

Config options that take 5 minutes to add to your project.

### Optimize deps and only deps

Put this in your `Cargo.toml`:

```toml
[profile.dev.package.'*']
opt-level = 3
```

Expected speedup: TODO

### Use nightly, lld and -Zshare-generics

TODO maneion nightly is not evil, bad, special or whatever, just a slightly newer version which also accepts more config options

TODO also won't make your project nightly only - people can still compile on stable, just without the speedups

Put this in `.cargo/config.toml` in your project:

```toml
# This is from https://github.com/bevyengine/bevy/blob/main/.cargo/config_fast_builds but modified.
# Explanation: https://bevyengine.org/learn/book/getting-started/setup/ - CTRL+F Enable Fast Compiles (Optional)
# To get faster compile times, rename this to config.toml and rust-toolchain-example.toml to rust-toolchain.toml
# You can use symlinks to get potential future updates - run these in project root:
#   ln -s rust-toolchain-example.toml rust-toolchain.toml
#   cd .cargo
#   ln -s config-example.toml config.toml

# panic = "abort" disables unwind tables so backtraces are almost completely useless,
# if a panic happens inside library code, we don't even get names of our functions.
# To fix that, we use -Cforce-unwind-tables=y in .cargo/config.toml.
# https://github.com/rust-lang/rust/issues/81902

# NOTE: For maximum performance, you need a nightly compiler
# If you are using rust stable, remove the "-Zshare-generics=y" below.

[target.x86_64-unknown-linux-gnu]
linker = "/usr/bin/clang"
rustflags = ["-Clink-arg=-fuse-ld=lld", "-Zshare-generics=y", "-Cforce-unwind-tables=y"]

# NOTE: you must manually install https://github.com/michaeleisel/zld on mac. you can easily do this with the "brew" package manager:
# `brew install michaeleisel/zld/zld`
[target.x86_64-apple-darwin]
rustflags = ["-Clink-arg=-fuse-ld=/usr/local/bin/zld", "-Zshare-generics=y", "-Cforce-unwind-tables=y"]

[target.aarch64-apple-darwin]
rustflags = ["-Clink-arg=-fuse-ld=/usr/local/bin/zld", "-Zshare-generics=y", "-Cforce-unwind-tables=y"]

[target.x86_64-pc-windows-msvc]
linker = "rust-lld.exe"
rustflags = ["-Zshare-generics=n", "-Cforce-unwind-tables=y"]

# Optional: bevy suggests reducing debug to 1 (line number tables), matklad / rust-analyzer suggests 0.
# In most cases the gains are negligible, but if you are on macos and have slow compile times you should see significant gains.
# Seems to have no effect for me on linux.
# Note it's possible to set this for specific packages in Cargo.toml - e.g.
# https://gitlab.com/veloren/airshipper/-/blob/1acd0e648162f87964f5a3d2c756d028f5ea3750/Cargo.toml#L22
[profile.dev]
debug = 1
```

TODO this is from https://github.com/rustcycles/rustcycles/blob/master/.cargo/config-example.toml - cleanup, simplify

TODO -Zshare-generics broken on windows? maybe only with dyn linking? https://github.com/bevyengine/bevy-website/pull/137
    also dyn linking is broken on linux anyway - e.g. fyrox

TODO no zld on mac
TODO https://github.com/bevyengine/bevy/commit/a9e2dee7321150ab70696e8591788741a4a014de

Expected speedup: TODO

### On linux, use the `mold` linker

Install [mold](https://github.com/rui314/mold).

Use `mold -run cargo run` to run your project. I recommand making an alias for your shell.

Expected speedup: TODO (RustCycles from 12 s to 2.5 s)

## More elaborate tips with more elaborate explanations

opt-level=1 vs 0: https://rust.godbolt.org/z/sMMr6qejf
        https://vittorioromeo.info/index/blog/debug_performance_cpp.html

https://kobzol.github.io/rust/rustc/2023/10/21/make-rust-compiler-5percent-faster.html
    - RecWars: 3.5 to 3.3 s -> 10% faster [10-percent]

[^10-percent]: When i measured this, i was actually disappointed - I only saved 200 ms which is not much and hardly noticeable in normal usage. Yet it's a 10% speedup - twice more than advertized. Definitely worth it, given it's practically free and only requires setting an environment variable.

## Other things i tried and stopped using

- RA clippy, separate build dir

- shared global build dir

## Prior art

improvements listed in replies to my post

nnethercote's reply to my reddit post

from mirashii:
    https://endler.dev/2020/rust-compile-times/
    https://fasterthanli.me/articles/why-is-my-rust-build-so-slow#rustc-self-profiling
        read again - `summarize` cmd, min duration
    https://nnethercote.github.io/perf-book/compile-times.html


## Future work

dylib
    link to issue
    darth [...] obviously just needed this :comfglare: RUSTFLAGS="-C prefer-dynamic"

sccache - shouldn't work but one guy is adamant it does

let other people run the experiments

keep updating thi article

update nnethercote's wiki

TODO reference claims vs reality - what affects proc macros?

## Credit where it's due

The idea to optimize deps even in debug builds is from [macroquad](https://github.com/not-fl3/macroquad).

A lot of `.cargo/config.toml` is from [bevy](https://github.com/bevyengine/bevy),

Special thanks to darth and mirashii for their suggestions and advice.

---

## TODOS

- `[profile.dev.package.'*']` does it affect workspace?
    - says yes https://stackoverflow.com/questions/60751806/how-to-compile-some-dependencies-with-release

darth
    - test opt-level = 1 for deps
    - if you move things whihc use proc macros into their own crate they won't get re-run when you touch code outside of the crate
    - same with include_dir which I use for my assets, that's also in its own crate, and can easily take like 5s extra build time
    - after I moved serde and include_dir into their own crates and set the serde one as dylib I'm at 0.45s for incremental builds in my small game
        - obviously just needed this :comfglare: RUSTFLAGS="-C prefer-dynamic"

mirashii
    - monomorphizing big generics
    - how much time does linking take?

darth/mirashii
    - `-Z dump-mono-stats`
    - I thought the slowness was in the #[derive(Serialize, Deserialize)] and not in the monomorphization of serde_json::from_str::<T>(...)
    - if I monomorphize it in the crate and then do it again in the main crate it doesn't take long, maybe this is the share-generics=y thing
    - worth noting that monomorphization always happens in the calling crate unless there was already an equivalent monomorphization in a dependency (and -Z share-generics is on, which, notably, isn't for release builds iirc)
    - LATER test idea: include dummy functions in subcrate to force monomorphization there

might not help - didn't for me on cvars

TODO does this all work with workspaces?

darth
    put the quicktype.rs into its own crate, and add a function that parses the json via serde in that crate, and make it non-generic

I encourage everyone who tries these changes to share their results - ideally the rough size of your project and how long incremental took before and after. If you measure it differently, please also explain why because it affects the results a lot.

track incremental on CI - ask darth how exactly he does it - would be nice if the output was easy to compare across many commits, note GH has limited retention

including git version in binary - build.rs vs proc macro - effects?

https://github.com/rust-lang/compiler-team/issues/681

https://github.com/rust-lang/rustc_codegen_cranelift/issues/171#issuecomment-1777116533
    try rec-wars again

tip: move proc macro calls to a subcrate so it doesn't get reexpanded every time you recompile the parent crate you're working on - e.g. qc2rust LR parser

https://old.reddit.com/r/rust/comments/1868mne/investigating_crazy_compile_times/

https://briankung.dev/2023/07/16/rust-notes/ - The build times - he's talking about full

mention changing rustflags causes a full recompile

Is this worth it? On a random day I spent 5 hours working on my game, 7 minutes of that was spent compiling. Without optimizations i would have spent TODO staring at the compiler's progress bar. If it takes you TODO to read this article and implement the changes in your project, it'll pay off in a single day.

TODO make all my readmes/configs/tomls point to this instead
