defmodule Bank do
  defstruct [rates: %{}]

  def add_rate(bank, source_currency, target_currency, rate) do
    %Bank{rates: %{[source_currency, target_currency] => rate}}
  end

  def rate(bank, source_currency, target_currency) do
    Map.get(bank.rates, [source_currency, target_currency], 1)
  end

  def reduce(expression, currency, bank \\ %Bank{}) do
    case expression do
      %Money{} -> Money.reduce(expression, bank, currency)
      %Sum{} -> Sum.reduce(expression, currency)
    end
  end
end
