require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
      @room0 = Room.new("Gold Room", 10)
      @song0 = Song.new("It's getting Boring by the Sea")
      @guest0 = Guest.new("Jon", 75, "It's getting Boring by the Sea")
      @guest1 = Guest.new("Mat", 50, "It's getting Boring by the Sea")
      @guest2 = Guest.new("Rach", 60, "It's getting Boring by the Sea")
      @guest3 = Guest.new("Mike", 80, "It's getting Boring by the Sea")
      @guest4 = Guest.new("Jenny", 45, "It's getting Boring by the Sea")
      @guest5 = Guest.new("Kieran", 55, "It's getting Boring by the Sea")
  end

  def test_room_has_number
    assert_equal("Gold Room", @room0.name)
  end

  def test_room_has_a_till
    assert_equal(0, @room0.cash)
  end

  def test_room_has_playlist
    assert_equal([], @room0.playlist)
  end

  def test_room_can_add_song
    @room0.add_song(@song0)
    assert_equal([@song0], @room0.playlist)
  end

  def test_room_has_guest_list
    assert_equal([], @room0.guest_list)
  end

  def test_room_can_add_guest
    @room0.add_guest(@guest0)
    assert_equal([@guest0], @room0.guest_list)
  end

  def test_room_can_remove_guest
    @room0.add_guest(@guest0)
    @room0.add_guest(@guest1)
    @room0.remove_guest(@guest0)
    assert_equal([@guest1], @room0.guest_list)
  end

  def test_room_can_reject_one_guest_when_full
    @room0.add_guest(@guest0)
    @room0.add_guest(@guest1)
    @room0.add_guest(@guest2)
    @room0.add_guest(@guest3)
    @room0.add_guest(@guest4)
    assert_equal("Sorry, this room is full", @room0.add_guest(@guest5))
  end

  def test_room_can_reject_multiple_guests_when_exceeds_capacity
    @room0.add_guest(@guest0)
    @room0.add_guest(@guest1)
    @room0.add_guest(@guest2)
    @room0.add_guest(@guest3)
    assert_equal("Sorry, we can't fit you all", @room0.add_guest([@guest4, @guest5]))
  end

  def test_room_can_charge_guest
    @room0.charge_guest(@guest0)
    assert_equal(65, @guest0.wallet)
    assert_equal(10, @room0.cash)
  end

  def test_room_can_add_and_charge_multiple_guests
    @room0.add_guest([@guest0, @guest1])
    assert_equal(2, @room0.guest_list.length)
    assert_equal(65, @guest0.wallet)
    assert_equal(40, @guest1.wallet)
  end

  def test_check_for_favourites
    @room0.add_song(@song0)
    @room0.add_guest(@customer0)
    assert_equal("Yeah!", @room0.check_for_favourites(@guest0))
  end

end
