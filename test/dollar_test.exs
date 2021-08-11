defmodule DollarTest do
  use ExUnit.Case
  doctest Dollar

  test "multiplication" do
    five = %Dollar{amount: 5}
    assert %Dollar{amount: 10} == Dollar.times(five, 2)
    assert %Dollar{amount: 15} == Dollar.times(five, 3)
  end

  test "equality" do
    assert Dollar.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    assert !Dollar.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
  end
end
