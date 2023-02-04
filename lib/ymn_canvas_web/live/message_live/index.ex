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
      fill_style(Enum.random(["red","green"])),
      fill_rect(Enum.random(10..300), Enum.random(10..300), Enum.random(1..5), Enum.random(1..5))
    ]
  end
end
