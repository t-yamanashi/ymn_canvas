export const render = (data) => {
    const canvas = document.querySelector('canvas');
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'green';
    switch (data.fn) {
        case "fillRect":
            ctx.fillRect(data.x, data.y, data.w, data.h);
        default:
            console.log("no functjion");
    }
    
  }


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