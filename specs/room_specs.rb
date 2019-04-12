require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
      @room0 = Room.new(0)
      @guest0 = Guest.new("Jon")
      @guest1 = Guest.new("Mat")
      @guest2 = Guest.new("Rach")
      @guest3 = Guest.new("Mike")
      @guest4 = Guest.new("Jenny")
      @guest5 = Guest.new("Kieran")
  end

  def test_room_has_number
    assert_equal(0, @room0.number)
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

end
