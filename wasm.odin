package wasm

import "core:mem"

foreign import env "env";

@(default_calling_convention="contextless")
foreign env {
    print_string_ptr_len :: proc(ptr: ^u8, len: int) ---
    fill_canvas :: proc(x, y, w, h: int, col: u32) ---
}

print :: proc (s: string) {
    x := transmute(mem.Raw_String)s;
    print_string_ptr_len(x.data, x.len);
}


@export
add :: proc "contextless" (x: i32, y: i32) -> i32 {
    return x + y;
}

// No idea why main exports for ginerbill stream and not for me
// Stream is several years old thoguh
@export
_main :: proc () {
    main()
}

main :: proc() {
    print("Hellope!")
    fill_canvas(10, 10, 100, 50, 0xffffff);
}