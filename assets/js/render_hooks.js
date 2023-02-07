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
            ctx.fillRect(...data.arg);
            break;
        case 'fillStyle':
            ctx.fillStyle = data.arg;
            break;
        case 'strokeStyle':
            ctx.strokeStyle = data.arg;
            break;
        case 'beginPath':
            ctx.beginPath();
            break;
        case 'stroke':
            ctx.stroke();
            break;
        case 'arc':
            ctx.arc(...data.arg);
            break;
        case "moveTo":
            ctx.moveTo(...data.arg);
            break;
        case "lineTo":
            ctx.lineTo(...data.arg);
            break;
        default:
            console.log("no function");
    }
}