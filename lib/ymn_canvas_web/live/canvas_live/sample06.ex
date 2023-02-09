defmodule YmnCanvasWeb.CanvasLive.Sample06 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)

    {:ok, socket |> assign(data: []) |> assign(character: %{x: 0, y: 0}) }
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 400)


    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character))
     |> assign(data: create_data(socket.assigns.character))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <audio id="b1">
      <source src="/audio/b1.mp3" type="audio/mp3">
    </audio>
    <audio id="b2">
      <source src="/audio/b2.mp3" type="audio/mp3">
    </audio>
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  def crate_character(character) do
    x = Map.get(character, :x, 0) + 1
    x = rem(x, 4)
    y = rem(x, 2)
    %{x: x, y: y}
  end

  def create_data(character) do

    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      font("48px serif"),
      fill_style("#00AA00"),
      fill_text(character[:x], 180, 400),
      play("#b1"),
    ] ++ if character[:y] == 0, do: [ play("#b2")], else: []
  end
end
