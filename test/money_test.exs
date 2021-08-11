defmodule MoneyTest do
  use ExUnit.Case
  doctest Money

  test "mixed addition" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.add_rate(%Bank{}, "CHF", "USD", 2)
    sum = Money.plus(five_bucks, ten_francs)
    result = Bank.reduce(sum, bank, "USD")
    assert Money.dollar(10) == result
  end

  test "addition with bank" do
    five = Money.dollar(5)
    sum = Money.plus(five, five)
    reduced = Bank.reduce(sum, %Bank{}, "USD")
    assert Money.dollar(10) == reduced
  end

  test "sum plus money" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.add_rate(%Bank{}, "CHF", "USD", 2)
    sum = Money.plus(Money.plus(five_bucks, ten_francs), five_bucks)
    result = Bank.reduce(sum, bank, "USD")
    assert Money.dollar(15) == result
  end

  test "sum times" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.add_rate(%Bank{}, "CHF", "USD", 2)
    sum = Money.times(Money.plus(five_bucks, ten_francs), 2)
    result = Bank.reduce(sum, bank, "USD")
    assert Money.dollar(20) == result
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
    reduced = Bank.reduce(sum, %Bank{}, "USD")
    assert Money.dollar(10) == reduced
  end

  test "reduce money" do
    result = Bank.reduce(Money.dollar(1), %Bank{}, "USD")
    assert Money.dollar(1) == result
  end

  test "reduce money, different currency" do
    bank = Bank.add_rate(%Bank{}, "CHF", "USD", 2)
    result = Bank.reduce(Money.franc(2), bank, "USD")
    assert Money.dollar(1) == result
  end

  test "identity rate" do
    assert 1 == Bank.rate(%Bank{}, "USD", "USD")
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
