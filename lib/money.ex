defmodule Money do
  defstruct [:amount, :currency]

  def times(dollar, multiplier) do
    %Money{amount: dollar.amount * multiplier, currency: dollar.currency}
  end

  def equals(money, other_money) do
    money.amount == other_money.amount && money.__struct__ == other_money.__struct__
  end
end
