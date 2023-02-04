defmodule YmnCanvasWeb.MessageLive.Index do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 100)

    {:ok,
     socket
     |> assign(data: create_data())}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 100)

    {:noreply,
     socket
     |> assign(data: create_data())}
  end

  def create_data() do
    [
      #fill_style(Enum.random(["red","green"])),
      #/fill_rect(Enum.random(10..300), Enum.random(10..300), Enum.random(1..5), Enum.random(1..5))
      fill_style("#FFFFBB"),
      fill_rect(1, 1, 640, 480),
      fill_style("#FFFFDD"),
      fill_rect(10, 10, 620, 460),
      stroke_style("red"),
      begin_path(),
      arc(300, 200, 100, 0, 2 * :math.pi()),
      stroke()
    ]
  end
end
