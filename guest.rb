class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def spend_money(amount)
    @wallet -= amount
  end

  def cheer#(playlist)
    #playlist.each do|song|
    return "Yeah!" #if song.title == @favourite_song
  #  end
  end

end
