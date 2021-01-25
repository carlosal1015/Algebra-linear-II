#!/usr/bin/env python

from manim import Scene, ShowCreation, Circle


class Test(Scene):
    def construct(self):
        self.play(ShowCreation(Circle()))
        self.wait()
# manim test.py Test -pqh
