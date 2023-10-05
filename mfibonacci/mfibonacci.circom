pragma circom 2.0.0;

template MultiplicativeFibonacci(n) {
    signal input s0; // witness. Private by default
    signal input s1; // Private by default
    signal output out; // public by default
    signal im[n-2]; // s0, s1 plus 1022 sum up 1024 values.

    // Cumptation part:
    // im[0] <-- s0 * s1; // im[0] it's calculated as s0*s1
    // Constraint part:
    // im[0] === s0 * s1; // this is a  r1cs restriction. im[0] must satisfy this equation.
    // Merge of both operators: Computation and calculation:
    im[0] <== s0 * s1; // im[0] it's calculated as s0*s1 and it's restricted to be equal to s0*s1
    im[1] <== s1 * im[0];

    for (var i = 2; i < n-2; i++) {
        im[i] <== im[i-1] * im[i-2];
    }

    out <== im[n-3];
}

component main = MultiplicativeFibonacci(1024);
