defmodule Sum do
  @moduledoc false
  defstruct [:augend, :addend]

  def reduce(sum, currency) do
    %Money{amount: sum.augend.amount + sum.addend.amount, currency: currency}
  end
end
