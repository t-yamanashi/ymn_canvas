defmodule YmnCanvas.Draw do
  @doc """
  四角で塗りつぶす
  """
  def fill_rect(x, y, w, h) do
    %{
      fn: "fillRect",
      x: x,
      y: y,
      w: w,
      h: h
    }
  end

  @doc """
  塗りつぶす色を指定する
  """
  def fill_style(style) do
    %{
      fn: "fillStyle",
      style: style
    }
  end

  def stroke_style(style) do
    %{
      fn: "strokeStyle",
      style: style
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
      x: x,
      y: y,
      radius: radius,
      start_angle: start_angle,
      end_angle: end_angle
    }
  end

  def move_to(x, y) do
    %{
      fn: "moveTo",
      x: x,
      y: y,
    }
  end

  def line_to(x, y) do
    %{
      fn: "lineTo",
      x: x,
      y: y,
    }
  end

end
