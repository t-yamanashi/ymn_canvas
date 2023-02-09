defmodule YmnCanvasWeb.CanvasLive.Sample05 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)
    {:ok, socket |> assign(data: []) |> assign(character: %{})}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 25)

    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character))
     |> assign(data: create_data(socket.assigns.character))}
  end

  @impl true
  def handle_event("key-down", %{"key" => "ArrowLeft"}, socket) do
    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character, -30, 0))}
  end

  @impl true
  def handle_event("key-down", %{"key" => "ArrowRight"}, socket) do
    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character, 30, 0))}
  end

  @impl true
  def handle_event("key-down", %{"key" => "ArrowUp"}, socket) do
    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character, 0, -30))}
  end

  @impl true
  def handle_event("key-down", %{"key" => "ArrowDown"}, socket) do
    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character, 0, 30))}
  end

  @impl true
  def handle_event("key-down", _param, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div phx-window-keydown="key-down">
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    </div>
    """
  end

  def crate_character(character) do
    x = Map.get(character, :x, 500)
    y = Map.get(character, :y, 300)
    %{x: x, y: y}
  end

  def crate_character(character, fx, fy) do
    x = Map.get(character, :x, 500) + fx
    y = Map.get(character, :y, 300) + fy
    %{x: x, y: y}
  end

  def create_data(character) do
    now = DateTime.utc_now()

    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      fill_style("#00FF00"),
      fill_rect(character[:x], character[:y], 50, 50),
      font("48px serif"),
      fill_style("#00AA00"),
      fill_text(now, 180, 400)
    ]
  end
end
