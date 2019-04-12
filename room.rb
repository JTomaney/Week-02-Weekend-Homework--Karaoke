require("pry")

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
    case
      when guest.is_a?(Guest)
        if @guest_list.length < 5
          @guest_list.push(guest)
        else
          return "Sorry, this room is full"
        end
      when guest.is_a?(Array)
        if @guest_list.length + guest.length <= 5
          @guest_list += guest
        else
          return "Sorry, we can't fit you all"
        end
    end
  end

  def remove_guest(guest)
    @guest_list.delete(guest)
  end

end
