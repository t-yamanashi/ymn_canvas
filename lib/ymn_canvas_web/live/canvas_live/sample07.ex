defmodule YmnCanvasWeb.CanvasLive.Sample07 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw
  alias Ymn

  @impl true
  def render(assigns) do
    ~H"""
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)
    character = 1..4 |> Enum.map(fn _ -> Ymn.init() end)
    {:ok, socket |> assign(data: []) |> assign(character: character)}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 25)
    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character))
     |> assign(data: create_data(socket.assigns.character))}
  end


  def crate_character(character) do
    character
    |> Enum.map(fn c -> Ymn.move(c) end)
  end

  def create_data([h | t]) do
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      stroke_style("#00FF00"),
      begin_path(),
      move_to(h.x, h.y)
    ] ++
      Enum.map(t, fn c ->
        line_to(c.x, c.y)
      end) ++
      [
        line_to(h.x, h.y),
        stroke()
      ]
  end
end
