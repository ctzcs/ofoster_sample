package main

import "core:fmt"
import foster "olib:foster"

main :: proc() {
	values := []f32{3, 1, 2}
	fmt.println("smallest/largest/closest:", foster.Smallest(values), foster.Largest(values), foster.GetClosestValue(values, f32(1.6)))
	indices: [dynamic]int = {}
	foster.Triangulate([]foster.Vec2{{0, 0}, {2, 0}, {2, 2}, {0, 2}}, &indices)
	fmt.println("triangulation:", indices)
	v, ok := foster.ParseVector2("1.5,2.5", ',')
	fmt.println("parse/hash:", v, ok, foster.StaticStringHash("abc"))
}
