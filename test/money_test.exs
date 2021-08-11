defmodule MoneyTest do
  use ExUnit.Case
  doctest Money

  test "addition with bank" do
    five = Money.dollar(5)
    sum = Money.plus(five, five)
    reduced = Bank.reduce(sum, "USD")
    assert Money.dollar(10) == reduced
  end

  test "plus returns sum" do
    five = Money.dollar(5)
    sum = Money.plus(five, five)
    assert sum.augend == five
    assert sum.addend == five
  end

  test "reduce sum" do
    five = Money.dollar(5)
    sum = %Sum{augend: five, addend: five}
    reduced = Bank.reduce(sum, "USD")
    assert Money.dollar(10) == reduced
  end

  test "reduce money" do
    result = Bank.reduce(Money.dollar(1), "USD")
    assert Money.dollar(1) == result
  end

  test "multiplication" do
    five = Money.dollar(5)
    assert Money.dollar(10) == Money.times(five, 2)
    assert Money.dollar(15) == Money.times(five, 3)
  end

  test "dollar equality" do
    assert Money.equals(Money.dollar(5), Money.dollar(5))
    assert !Money.equals(Money.dollar(5), Money.dollar(6))
    assert !Money.equals(Money.franc(5), Money.dollar(5))
  end
end
