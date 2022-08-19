defmodule CrudMakerTest do
  use ExUnit.Case
  doctest CrudMaker

  test "greets the world" do
    assert CrudMaker.hello() == :world
  end
end
