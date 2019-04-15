require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest0 = Guest.new("Jon", 75, "It's Getting Boring by the Sea")
    song0 = Song.new("Let the Day begin")
    song1 = Song.new("It's Getting Boring by the Sea")
    @playlist = [song0, song1]
  end

  def test_guest_has_name
    assert_equal("Jon", @guest0.name)
  end

  def test_guest_has_money
    assert_equal(75, @guest0.wallet)
  end

  def test_guest_has_favourite_song
    assert_equal("It's Getting Boring by the Sea", @guest0.favourite_song)
  end

  def test_guest_can_spend_money
    @guest0.spend_money(15)
    assert_equal(60, @guest0.wallet)
  end

  def test_guest_can_cheer
    assert_equal("Yeah!", @guest0.cheer)
  end

end
