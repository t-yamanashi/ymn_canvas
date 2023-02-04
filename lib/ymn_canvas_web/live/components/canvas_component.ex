defmodule YmnCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div id="canvas_div" phx-hook="canvas" data-canvas={Jason.encode!(@data)}>
      <canvas id="canvas_area"  width="1024" height="768">
      </canvas>
    </div>
    """
  end
end
