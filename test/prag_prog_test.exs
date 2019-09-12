defmodule PragProgTest do
  use ExUnit.Case
  doctest PragProg

  test "greets the world" do
    assert PragProg.hello() == :world
  end
end
