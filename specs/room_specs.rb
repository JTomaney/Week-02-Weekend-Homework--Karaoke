require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../room.rb")

class RoomTest < MiniTest::Test

  def setup
      @room0 = Room.new(0)
  end

  def test_room_has_number
    assert_equal(0, @room0.number)
  end

  def test_room_has_playlist
    assert_equal([], @room0.playlist)
  end

  def test_room_has_guest_list
    assert_equal([], @room0.guest_list)
  end



end
