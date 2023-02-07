defmodule YmnCanvas.Draw do
  @doc """
  四角で塗りつぶす
  """
  def fill_rect(x, y, w, h) do
    %{
      fn: "fillRect",
      arg: [x, y, w, h]
    }
  end

  @doc """
  塗りつぶす色を指定する
  """
  def fill_style(style) do
    %{
      fn: "fillStyle",
      arg: style
    }
  end

  def stroke_style(style) do
    %{
      fn: "strokeStyle",
      arg: style
    }
  end

  def begin_path() do
    %{
      fn: "beginPath"
    }
  end

  def stroke() do
    %{
      fn: "stroke"
    }
  end

  def arc(x, y, radius, start_angle, end_angle) do
    %{
      fn: "arc",
      arg: [x, y, radius, start_angle, end_angle]
    }
  end

  def move_to(x, y) do
    %{
      fn: "moveTo",
      arg: [x, y]
    }
  end

  def line_to(x, y) do
    %{
      fn: "lineTo",
      arg: [x, y]
    }
  end
end
