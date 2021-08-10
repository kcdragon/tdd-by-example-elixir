defmodule TDDTest do
  use ExUnit.Case
  doctest TDD

  test "greets the world" do
    assert TDD.hello() == :world
  end
end
