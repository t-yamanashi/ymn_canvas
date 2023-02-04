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
    const canvas = document.querySelector('canvas');
    const ctx = canvas.getContext('2d');
    datas.map(data => render_exec(ctx, data));    
  }

const render_exec = (ctx, data) => {
    switch (data.fn) {
        case "fillRect":
            ctx.fillRect(data.x, data.y, data.w, data.h);
        case 'fillStyle':
            ctx.fillStyle = data.style;
        default:
            console.log("no functjion");
    }
}