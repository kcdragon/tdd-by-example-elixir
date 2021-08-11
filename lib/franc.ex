defmodule Franc do
  defstruct [:amount]

  def times(franc, multiplier) do
    %Franc{amount: franc.amount * multiplier}
  end
end
