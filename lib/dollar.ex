defmodule Dollar do
  defstruct [:amount]

  def times(dollar, multiplier) do
    %Dollar{amount: dollar.amount * multiplier}
  end
end
