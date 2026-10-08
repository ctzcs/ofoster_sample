package main

import "core:fmt"
import "core:os"
import internal "olib:foster/internal/third_party"
import foster "olib:foster"

main :: proc() {
	font_data, err := os.read_entire_file_from_path("C:/Windows/Fonts/AGENCYB.TTF", context.temp_allocator)
	if err != nil {
		fmt.println("font-file-unavailable")
		return
	}
	font := foster.FontMake(font_data)
	scale := foster.FontGetScale(&font, 24)
	ch := foster.FontGetCharacter(&font, 'A', scale)
	bitmap := foster.FontRasterize(&font, 'A', scale)
	fmt.println("stb:", internal.StbTrueTypeAvailable(), "metrics:", font.Ascent, font.Descent, "glyph:", ch.GlyphIndex, ch.Width, ch.Height, "pixels:", len(bitmap))
}
