export const hooks = {
  canvas: {
    mounted() {
      render(JSON.parse(this.el.dataset.canvas));
    },
    updated() {
      render(JSON.parse(this.el.dataset.canvas));
    },
  },
};

const render = (datas) => {
  const canvasBuffer = document.querySelector("#canvas_buffer");
  const ctxBuffer = canvasBuffer.getContext("2d");
  datas.map((data) => render_exec(ctxBuffer, data));
  const canvasArea = document.querySelector("#canvas_area");
  const ctxArea = canvasArea.getContext("2d");
  bufferImage = ctxBuffer.getImageData(0, 0, 1024, 768);
  ctxArea.putImageData(bufferImage, 0, 0);
};

const render_exec = (ctx, data) => {
  [fn_name, ...arg] = data;
  fn = render_function[fn_name];
  if (fn == undefined) {
    console.log("no function");
    return;
  }
  fn(ctx, arg);
};

const render_function = {
  fillRect: (ctx, arg) => ctx.fillRect(...arg),
  fillStyle: (ctx, arg) => (ctx.fillStyle = arg),
  strokeStyle: (ctx, arg) => (ctx.strokeStyle = arg),
  beginPath: (ctx, _arg) => ctx.beginPath(),
  stroke: (ctx, _arg) => ctx.stroke(),
  arc: (ctx, arg) => ctx.arc(...arg),
  moveTo: (ctx, arg) => ctx.moveTo(...arg),
  lineTo: (ctx, arg) => ctx.lineTo(...arg),
};
