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


end
