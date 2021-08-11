defmodule Money do
  defstruct [:amount, :currency]

  def dollar(amount) do
    %Money{amount: amount, currency: "USD"}
  end

  def franc(amount) do
    %Money{amount: amount, currency: "CHF"}
  end

  def plus(money, money) do
    %Money{amount: money.amount + money.amount, currency: money.currency}
  end

  def times(money, multiplier) do
    %Money{amount: money.amount * multiplier, currency: money.currency}
  end

  def equals(money, other_money) do
    money.amount == other_money.amount && money.currency == other_money.currency
  end
end
