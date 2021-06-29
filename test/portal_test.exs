defmodule PortalTest do
  use ExUnit.Case
  doctest Portal

  test "It should start the transfer" do
    Portal.shoot(:orange_1)
    Portal.shoot(:blue_1)
    Portal.transfer(:orange_1, :blue_1, [1, 2, 3, 4])
    assert Portal.Door.get(:orange_1) == [4, 3, 2, 1]
    assert Portal.Door.get(:blue_1) == []
  end

  test "It should push_right an item" do
    Portal.shoot(:orange_2)
    Portal.shoot(:blue_2)
    portal = Portal.transfer(:orange_2, :blue_2, [1, 2, 3, 4])
    Portal.push_right(portal)
    assert Portal.Door.get(:orange_2) == [3, 2, 1]
    assert Portal.Door.get(:blue_2) == [4]
  end

  test "It should push_left an item" do
    Portal.shoot(:orange_3)
    Portal.shoot(:blue_3)
    portal = Portal.transfer(:orange_3, :blue_3, [1, 2, 3, 4])
    Portal.push_right(portal)
    assert Portal.Door.get(:orange_3) == [3, 2, 1]
    assert Portal.Door.get(:blue_3) == [4]
    Portal.push_right(portal)
    assert Portal.Door.get(:orange_3) == [2, 1]
    assert Portal.Door.get(:blue_3) == [3, 4]
    Portal.push_left(portal)
    assert Portal.Door.get(:orange_3) == [3, 2, 1]
    assert Portal.Door.get(:blue_3) == [4]
  end
end
