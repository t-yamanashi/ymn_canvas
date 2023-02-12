defmodule YmnCanvasWeb.CanvasLive.Sample09 do
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
    character = 1..20 |> Enum.map(fn _ -> Ymn.init() end)
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

  def create_data(t) do
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      font("#{Enum.random(75..80)}px serif"),
      fill_style("#00FF00"),

    ] ++
      Enum.map(t, fn c ->
        fill_text("闘魂", c.x, c.y)
      end)
  end
end
