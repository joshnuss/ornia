defmodule Ornia.CoreTest do
  use ExUnit.Case
  doctest Ornia.Core

  test "greets the world" do
    assert Ornia.Core.hello() == :world
  end
end
