export const hooks = {
    canvas: {
        mounted() {
            console.log("mount_hooks");
            render(JSON.parse(this.el.dataset.canvas));
        },
        updated() {
            console.log("update_hooks");
            render(JSON.parse(this.el.dataset.canvas));
        }
    }
}

const render = (datas) => {
    const canvasBuffer = document.querySelector('#canvas_buffer');
    const ctxBuffer = canvasBuffer.getContext('2d');
    datas.map(data => render_exec(ctxBuffer, data));    
    const canvasArea = document.querySelector('#canvas_area');
    const ctxArea = canvasArea.getContext('2d');
    bufferImage = ctxBuffer.getImageData(0, 0, 1024, 768);
    ctxArea.putImageData(bufferImage, 0, 0);
  }

const render_exec = (ctx, data) => {
    switch (data.fn) {
        case "fillRect":
            ctx.fillRect(data.x, data.y, data.w, data.h);
        case 'fillStyle':
            ctx.fillStyle = data.style;
        case 'strokeStyle':
            ctx.strokeStyle = data.style;
        case 'beginPath':
            ctx.beginPath();
        case 'stroke':
            ctx.stroke();
        case 'arc':
            ctx.arc(data.x, data.y, data.radius, data.start_angle, data.end_angle)
        case "moveTo":
            ctx.moveTo(data.x, data.y);
        case "lineTo":
            ctx.lineTo(data.x, data.y);
        default:
            console.log("no function");
    }
}