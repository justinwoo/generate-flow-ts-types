# generate types

## these are just disappointing string appending scripts. if you want to see something actually useful/horrible please see https://github.com/justinwoo/purescript-bundaegi!!!

scripts for generating some flow/ts types in haskell

looks like this when run:

```sh
[:~/Code/generate-types] master ± cabal run assign
Preprocessing executable 'assign' for generate-types-0.1.0.0...
Running assign...
assign<A, B, C, D, E, F, G>(a: A, b: B, c: C, d: D, e: E, f: F, g: G): A & B & C & D & E & F & G;
assign<A, B, C, D, E, F>(a: A, b: B, c: C, d: D, e: E, f: F): A & B & C & D & E & F;
assign<A, B, C, D, E>(a: A, b: B, c: C, d: D, e: E): A & B & C & D & E;
assign<A, B, C, D>(a: A, b: B, c: C, d: D): A & B & C & D;
assign<A, B, C>(a: A, b: B, c: C): A & B & C;
assign<A, B>(a: A, b: B): A & B;
assign<A>(a: A): A;
```
