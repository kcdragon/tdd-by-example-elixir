defmodule Franc do
  defstruct [:amount]

  def times(franc, multiplier) do
    %Franc{amount: franc.amount * multiplier}
  end

  def equals(franc, other_franc) do
    franc.amount == other_franc.amount
  end
end
