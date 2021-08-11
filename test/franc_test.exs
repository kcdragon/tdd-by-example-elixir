defmodule FrancTest do
  use ExUnit.Case
  doctest Franc

  test "multiplication" do
    five = %Franc{amount: 5}
    assert %Franc{amount: 10} == Franc.times(five, 2)
    assert %Franc{amount: 15} == Franc.times(five, 3)
  end
end
