require("minitest/autorun")
require("minitest/rg")

require_relative("../song.rb")

class SongTest < MiniTest::Test

  def test_song_has_name
    song = Song.new("Let the Day Begin")
    assert_equal("Let the Day Begin", song.title)
  end

end
