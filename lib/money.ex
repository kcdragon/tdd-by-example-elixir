defmodule Money do
  defstruct [:amount, :currency]

  def dollar(amount) do
    %Money{amount: amount, currency: "USD"}
  end

  def franc(amount) do
    %Money{amount: amount, currency: "CHF"}
  end

  def plus(money, other_money) do
    %Sum{augend: money, addend: other_money}
  end

  def times(expression, multiplier) do
    case expression do
      %Money{} -> %Money{amount: expression.amount * multiplier, currency: expression.currency}
      %Sum{} -> %Sum{augend: Money.times(expression.augend, multiplier), addend: Money.times(expression.addend, multiplier)}
    end
  end

  def equals(money, other_money) do
    money.amount == other_money.amount && money.currency == other_money.currency
  end

  def reduce(money, bank, target_currency) do
    rate = Bank.rate(bank, money.currency, target_currency)
    %Money{amount: money.amount / rate, currency: target_currency}
  end
end
