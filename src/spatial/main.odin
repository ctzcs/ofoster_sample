package main

import "core:fmt"
import thirdparty "olib:foster/internal/third_party"
import foster "olib:foster"

main :: proc() {
	p := foster.Point2{3, 4}
	fmt.println("point length:", foster.Point2Length(p))
	r := foster.RectInt{0, 0, 10, 10}
	fmt.println("contains:", foster.RectIntContains(r, foster.Point2{4, 4}))
	fmt.println("intersection area:", foster.RectIntArea(foster.RectIntIntersection(r, foster.RectInt{5, 5, 10, 10})))
	fmt.println("line intersection:", foster.LineIntIntersects(foster.LineIntMake(foster.Point2{0, 0}, foster.Point2{10, 10}), foster.LineIntMake(foster.Point2{0, 10}, foster.Point2{10, 0})))
	fmt.println("cardinal point:", foster.CardinalPoint(foster.CardinalLeft))
	float_rect := foster.Rect{0, 0, 10, 10}
	line_hit, line_point := foster.RectOverlapsLine(float_rect, foster.LineMake(foster.Vec2{-2, 5}, foster.Vec2{12, 5}))
	fmt.println("rect/line:", line_hit, line_point)
	circle_hit, pushout := foster.CircleOverlaps(foster.CircleMake(foster.Vec2{0, 0}, 5), foster.CircleMake(foster.Vec2{8, 0}, 5))
	fmt.println("circle overlap:", circle_hit, pushout)
	transform := foster.TransformMake(foster.Vec2{10, 20}, foster.Vec2{2, 2}, 0)
	transformed := foster.TransformPoint(&transform, foster.Vec2{1, 1})
	fmt.println("transform:", transformed, foster.TransformPointInverse(&transform, transformed))
	fmt.println("red rgba:", foster.RGBA(foster.Red), "format size:", foster.TextureFormatSize(.Color), "key:", foster.Keys.A)
	_ = foster.KeyboardState{}
	_ = foster.MouseState{}
	_ = foster.ControllerState{}
	_ = foster.StorageContainer{}
	fmt.println("ease:", foster.InOutQuad(0.25), "clamp:", foster.Clamp01(1.5))
	_ = foster.BindingAxisOverlapResolve(.CancelOut, foster.BindingState{}, foster.BindingState{})
	_ = foster.BatcherVertex{}
	_ = foster.Texture{}
	_ = foster.VertexFormat{}
	fake_texture := foster.Texture{Width = 64, Height = 32}
	subtexture := foster.SubtextureFromSource(&fake_texture, foster.Rect{16, 8, 32, 16})
	fmt.println("tex coords:", subtexture.TexCoords[0], subtexture.TexCoords[2])
	polygon := foster.PolygonMake(foster.Vec2{0, 0}, foster.Vec2{10, 0}, foster.Vec2{10, 10}, foster.Vec2{0, 10})
	fmt.println("polygon:", foster.PolygonContains(polygon, foster.Vec2{5, 5}), foster.PolygonArea(&polygon), len(polygon.Indices))
	rng := foster.RngMake(123)
	fmt.println("rng:", foster.RngIntMax(&rng, 10), foster.RngChance(&rng, 1))
	action_set := foster.ActionBindingSetMake()
	foster.ActionBindingSetAddKey(&action_set, foster.Keys.Space)
	input_state := foster.Input{}
	action := foster.VirtualActionMake(&input_state, "jump", action_set)
	foster.VirtualActionUpdate(&action, foster.Time{})
	fmt.println("virtual action:", action.Value, foster.EnumHas(3, 1), thirdparty.QoiIsFormat([]u8{'q', 'o', 'i', 'f'}))
}
