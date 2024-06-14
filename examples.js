"use strict";

const canvas = document.getElementById("my-canvas");
const ctx = canvas.getContext("2d");

(async () => {
  window.wasm = await window.odin.runWasm("wasm.wasm", null, {
    env: {
      get_canvas_width: () => canvas.width,
      get_canvas_height: () => canvas.height,
      draw_rect_filled: (x, y, w, h, col) => {
        ctx.beginPath();
        ctx.rect(x, y, w, h);
        const r = (col >> 24) & 0xff;
        const g = (col >> 16) & 0xff;
        const b = (col >> 8) & 0xff;
        const a = (col >> 0) & 0xff;
        ctx.fillStyle = `rgba(${r}, ${g}, ${b}, ${a})`;
        ctx.fill();
      },
    },
  });
})();
