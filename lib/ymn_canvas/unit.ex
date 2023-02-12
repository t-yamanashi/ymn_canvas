defmodule Ymn do
  defmodule Unit do
    defstruct x: 1, y: 1, fx: 10, fy: 10
  end

  def init() do
    %Unit{x: Enum.random(1..1000), y: Enum.random(1..700), fx: Enum.random(-5..5), fy: Enum.random(-10..10) }
  end

  def move(param = %Unit{}) do
    fx = if param.x > 990 or param.x < 0, do: -param.fx, else: param.fx
    fy = if param.y > 720 or param.y < 0, do: -param.fy, else: param.fy

    param
    |> Map.merge(%{x: param.x + fx, y: param.y + fy, fx: fx, fy: fy})
  end
end
