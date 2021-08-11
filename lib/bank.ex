defmodule Bank do
  @moduledoc false

  def reduce(expression, currency) do
    case expression do
      %Money{} -> expression
      %Sum{} -> Sum.reduce(expression, currency)
    end
  end
end
