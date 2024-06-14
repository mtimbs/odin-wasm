package wasm

import "core:mem"

foreign import env "env"

@(default_calling_convention = "contextless")
foreign env {
	print :: proc(str: string) ---
	draw_rect_filled :: proc(x, y, w, h: int, col: u32) ---
	get_canvas_width :: proc() -> int ---
	get_canvas_height :: proc() -> int ---
}


@(export)
add :: proc "contextless" (x: i32, y: i32) -> i32 {
	return x + y
}

// No idea why main exports for ginerbill stream and not for me
// Stream is several years old thoguh
@(export)
_main :: proc() {
	main()
}

main :: proc() {
	print("Debug log!")
	draw_rect_filled(0, 0, get_canvas_width(), get_canvas_height(), 0xFFF)
	draw_rect_filled(10, 10, 100, 50, 0xFF0000FF)
	draw_rect_filled(20, 30, 100, 50, 0xFF9900FF)
	draw_rect_filled(30, 50, 100, 50, 0xFFFF00FF)
	draw_rect_filled(40, 70, 100, 50, 0x00FF00FF)
	draw_rect_filled(50, 90, 100, 50, 0x0000FFFF)
}
