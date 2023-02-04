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
end
