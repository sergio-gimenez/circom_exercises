pragma circom 2.1.5;

template Multiplier() {
    signal input a ;
    signal input b ;
    signal output c ;
    c <== a * b ;
    log("a": a, "b": b, "c": c)
}

component main = Multiplier() ;
