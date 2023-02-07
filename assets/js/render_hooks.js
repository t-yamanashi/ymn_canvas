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
    [fn, ...arg] = data
    switch (fn) {
        case "fillRect":
            ctx.fillRect(...arg);
            break;
        case 'fillStyle':
            ctx.fillStyle = arg;
            break;
        case 'strokeStyle':
            ctx.strokeStyle = arg;
            break;
        case 'beginPath':
            ctx.beginPath();
            break;
        case 'stroke':
            ctx.stroke();
            break;
        case 'arc':
            ctx.arc(...arg);
            break;
        case "moveTo":
            ctx.moveTo(...arg);
            break;
        case "lineTo":
            ctx.lineTo(...arg);
            break;
        default:
            console.log("no function");
    }
}