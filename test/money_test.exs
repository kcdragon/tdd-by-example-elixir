defmodule MoneyTest do
  use ExUnit.Case
  doctest Money

  test "dollar multiplication" do
    five = %Dollar{amount: 5}
    assert %Dollar{amount: 10} == Dollar.times(five, 2)
    assert %Dollar{amount: 15} == Dollar.times(five, 3)
  end

  test "franc multiplication" do
    five = %Franc{amount: 5}
    assert %Franc{amount: 10} == Franc.times(five, 2)
    assert %Franc{amount: 15} == Franc.times(five, 3)
  end

  test "dollar equality" do
    assert Money.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    assert !Money.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
  end

  test "dollar and franc equality" do
    assert !Money.equals(%Dollar{amount: 5}, %Franc{amount: 5})
  end
end
