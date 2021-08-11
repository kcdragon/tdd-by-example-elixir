defmodule Money do
  defstruct [:amount, :currency]

  def dollar(amount) do
    %Money{amount: amount, currency: 'USD'}
  end

  def franc(amount) do
    %Money{amount: amount, currency: 'CHF'}
  end

  def times(dollar, multiplier) do
    %Money{amount: dollar.amount * multiplier, currency: dollar.currency}
  end

  def equals(money, other_money) do
    money.amount == other_money.amount && money.currency == other_money.currency
  end
end
