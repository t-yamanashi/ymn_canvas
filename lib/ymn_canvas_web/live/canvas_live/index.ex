defmodule YmnCanvasWeb.CanvasLive.Index do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)

    {:ok,
     socket
     |> assign(data: [])
     |> assign(x: 1)
    }
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 12)
    x = socket.assigns.x  +  1
    x = rem(x, 900)
    IO.inspect(x)
    {:noreply,
     socket
     |> assign(x: x)
     |> assign(data: create_data(x))}
  end

  def create_data(x) do
    r = :math.pi() / 180
    yy = :math.cos(x * r) * (x / 2)
    yy = yy + 384

    xx = :math.sin(x * 1.2 * r) * (x / 2)
    xx = xx + 512


    |> IO.inspect()
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      stroke_style("#00FF00"),
      begin_path(),
      arc(xx, yy, 20, 0, 2 * :math.pi()),
      move_to(512, 384),
      line_to(xx, yy),
      move_to(0, 0),
      line_to(xx, yy),
      move_to(1024, 768),
      line_to(xx, yy),
      move_to(0, 768),
      line_to(xx, yy),
      move_to(1024, 0),
      line_to(xx, yy),
      stroke()
    ]
  end
end
