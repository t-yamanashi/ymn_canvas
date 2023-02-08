defmodule YmnCanvasWeb.CanvasLive.Sample04 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 100)

    {:ok, socket |> assign(data: []) |> assign(character: crate_character(%{})) }
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
  def render(assigns) do
    ~H"""
    <img id="bg1" src="/images/bg1.png" style="display:none"/>
    <img id="bg2" src="/images/bg2.png" style="display:none"/>
    <img id="bg3" src="/images/bg3.png" style="display:none"/>
    <img id="piyo" src="/images/piyo.png" style="display:none"/>
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  def crate_character(character) do
    y = Map.get(character, :y, -500) + 10
    y = if y > 1, do: -500, else: y
    y2 = Map.get(character, :y2, -500) + 7
    y2 = if y2 > 1, do: -500, else: y2
    y3 = Map.get(character, :y3, -500) + 3
    y3 = if y3 > 1, do: -500, else: y3
    y4 = Map.get(character, :y4, -500) + 1
    y4 = if y4 > 1, do: -500, else: y4

    %{y: y, y2: y2, y3: y3, y4: y4}
  end

  def create_data(character) do

    (character[:y] + 10) |> IO.inspect()

   [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768)
    ]
    ++ Enum.map(0..16, fn z -> draw_image("#bg3", 1, (z * 100 ) + character[:y]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg1", 100, (z * 100 ) + character[:y2]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg1", 200, (z * 100 ) + character[:y3]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg2", 300, (z * 100 ) + character[:y4]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg2", 400, (z * 100 ) + character[:y4]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg2", 500, (z * 100 ) + character[:y4]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg2", 550, (z * 100 ) + character[:y4]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg2", 642, (z * 100 ) + character[:y4]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg1", 742, (z * 100 ) + character[:y3]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg1", 842, (z * 100 ) + character[:y2]) end)
    ++ Enum.map(0..16, fn z -> draw_image("#bg3", 942, (z * 100 ) + character[:y]) end)
    ++ [draw_image("#piyo", 500, 300)]
  end
end
