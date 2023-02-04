defmodule YmnCanvasWeb.MessageLive.Index do
  use YmnCanvasWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 100)

    {:ok,
     socket
     |> assign(x: Enum.random(10..300))
     |> assign(y: Enum.random(10..300))}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 100)

    {:noreply,
     socket
     |> assign(x: Enum.random(10..300))
     |> assign(y: Enum.random(10..300))}
  end
end
