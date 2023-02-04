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
    Process.send_after(self(), :update, 25)
    x = socket.assigns.x  +  1
    x = rem(x, 600)
    IO.inspect(x)
    {:noreply,
     socket
     |> assign(x: x)
     |> assign(data: create_data(x))}
  end

  def create_data(x) do
    [
      #fill_style("#FFFFFF"),
      #fill_rect(0, 0, 1024, 768),
      #fill_style(Enum.random(["red","green"])),
      #/fill_rect(Enum.random(10..300), Enum.random(10..300), Enum.random(1..5), Enum.random(1..5))
      # fill_style("#FFFFBB"),
      # fill_rect(1, 1, 640, 480),
      # fill_style("#FFFFDD"),
      # fill_rect(10, 10, 620, 460),
      stroke_style("#0000FF"),
      # begin_path(),
      # arc(300, 200, 100, 0, 2 * :math.pi()),
      # move_to(0, 0),
      # line_to(100, 100),
      move_to(0, 0),
      line_to(x * 8, 300),
      stroke()
    ]
  end
end
