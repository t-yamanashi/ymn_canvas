export const render = () => {
    const xdiv = document.querySelector('#x');
    const ydiv = document.querySelector('#y');
    x = xdiv.innerHTML;
    y = ydiv.innerHTML;
    const canvas = document.querySelector('canvas');
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'green';
    ctx.fillRect(x, y, 10, 10);
  }


export const hooks = {
    canvas: {
        mounted() {
            console.log("mount_hooks");
            render();
        },
        updated() {
            console.log("update_hooks");
            render();
        }
    }
}