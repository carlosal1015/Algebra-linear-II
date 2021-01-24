#!/usr/bin/env julia

using Latexify
#https://askubuntu.com/questions/705620/xclip-vs-xsel
#https://wiki.archlinux.org/index.php/clipboard
#copy_to_clipboard(true)

ex = :(x^n / (k^n + k^n));

latexify(ex);
latexify(1.2);
latexify(3 // 4);
latexify(:X_active);
latexify(:(a / (b + c)));

M = [
    :(c_1 * e^(-c_2 * t)) 3//4
    "x/(k+x)" :X_active
];
latexify(M);

m = [2//3 "e^(-c*t)" 1+3im; :(x / (x + k_1)) "gamma(n)" :(log10(x))];
latexify(m);

print(latexify("x/y"));

f(x) = x / 2;
#@code_lowered f(1.0);