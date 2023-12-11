+++
title = "Undefined Behavior Explained with Examples"
+++

In general, optimizations work by allowing the compiler to make more assumptions about your code. For example, in Rust, there can only be one mutable reference to a given place in memory. So when a function takes 2 mutable references, the compiler assumes they always point to different addresses.

Unoptimized code might load/save data from/to memory each time the reference is used. Optimized code can load data from both into registers in the beginning, do all computations using only registers (which is usually faster) and only save the new values back to memory at the end. But if the assumption is wrong (for example somebody used unsafe to mistakenly create 2 mut refs to the same address), then the behavior can be different depending on opt level. In unoptimized mode, updating data through one reference will immediately be visible when accessing it through the other, whereas the optimized version will continue using the original value in registers because it never notices the memory changed.
