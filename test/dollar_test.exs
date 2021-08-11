defmodule DollarTest do
  use ExUnit.Case
  doctest Dollar

  test "multiplication" do
    five = %Dollar{amount: 5}
    ten = Dollar.times(five, 2)
    assert 10 == ten.amount

    fifteen = Dollar.times(five, 3)
    assert 15 == fifteen.amount
  end

  test "equality" do
    assert Dollar.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    assert !Dollar.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
  end
end
