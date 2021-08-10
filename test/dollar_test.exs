defmodule DollarTest do
  use ExUnit.Case
  doctest Dollar

  test "multiplication" do
    five = %Dollar{amount: 5}
    ten = Dollar.times(five, 2)
    assert 10 == ten.amount
  end
end
