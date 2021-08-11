defmodule Sum do
  @moduledoc false
  defstruct [:augend, :addend]

  def reduce(sum, bank, currency) do
    amount = Bank.reduce(sum.augend, bank, currency).amount + Bank.reduce(sum.addend, bank, currency).amount
    %Money{amount: amount, currency: currency}
  end
end
