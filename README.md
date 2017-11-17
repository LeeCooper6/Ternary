# What is Ternary & How Does It Work?
Binary is base 2 meaning binary numbers are 0 or 1.
Ternary is base 3 meaning ternary numbers are 0, 1, or 2.
This ternary allows -1, 0, or 1 for symmetry's sake.
This ternary "rotates" circularly through values: -1 => 0 => 1.
This ternary spins in either direction: -1 => 0 => 1 or 1 => 0 => -1.
This ternary rolls over and loops circularly from 1 to -1 or -1 to 1. So -1 => 0 => 1 => -1... or 1 => 0 => -1 => 1...

# Why is This Useful? When Should I Use This?
I don't know. When do you need a Bool that has one extra value but isn't an Enum? When do you need to rotate circularly through exactly three states? It's useful from time to time but only occasionally.