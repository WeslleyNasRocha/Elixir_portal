defmodule PortalDoorTest do
  use ExUnit.Case
  doctest Portal.Door

  test "The door starts" do
    door = Portal.Door.start_link(:orange)
    assert match?({:ok, _}, door)
  end

  test "The door accepts a value" do
    Portal.Door.start_link(:orange)
    assert Portal.Door.push(:orange, 1)
  end

  test "The door accepts a value and returns it" do
    Portal.Door.start_link(:orange)
    Portal.Door.push(:orange, 1)
    assert Portal.Door.get(:orange) == [1]
  end

  test "The door accepts many values and returns them" do
    Portal.Door.start_link(:orange)
    Portal.Door.push(:orange, 1)
    Portal.Door.push(:orange, 2)
    Portal.Door.push(:orange, 3)
    assert Portal.Door.get(:orange) == [3, 2, 1]
  end

  test "The door pops the last value" do
    Portal.Door.start_link(:orange)
    Portal.Door.push(:orange, 1)
    Portal.Door.push(:orange, 2)
    Portal.Door.push(:orange, 3)
    assert Portal.Door.pop(:orange) == {:ok, 3}
  end

  test "The door returns a erro when tried to pop empty" do
    Portal.Door.start_link(:orange)
    assert Portal.Door.pop(:orange) == :error
  end
end
