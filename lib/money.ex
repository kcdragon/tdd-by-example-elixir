defmodule Money do
  def equals(money, other_money) do
    money.amount == other_money.amount && money.__struct__ == other_money.__struct__
  end
end
