defmodule Dollar do
  defstruct [:amount]

  def times(dollar, multiplier) do
    %Dollar{amount: dollar.amount * multiplier}
  end

  def equals(dollar, other_dollar) do
    dollar.amount == other_dollar.amount
  end
end
