defmodule YmnCanvasWeb.CanvasLive.Sample01 do
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
    Process.send_after(self(), :update, 16)
    x = socket.assigns.x  +  8
    x = rem(x, 1024)
    {:noreply,
     socket
     |> assign(x: x)
     |> assign(data: create_data(x))}
  end

  def create_data(x) do
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      fill_style("#00FF00"),
      fill_rect(x, 512, 50, 50),
    ]
  end
end
