class Room

  attr_reader :number, :playlist, :guest_list

  def initialize(number)
  @number = number
  @playlist = []
  @guest_list = []
  end

  def add_song(song)
    @playlist.push(song)
  end

  def add_guest(guest)
    @guest_list.push(guest)
  end

  def remove_guest(guest)
    @guest_list.delete(guest)
  end

end
