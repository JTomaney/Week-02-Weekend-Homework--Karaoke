require("pry")

class Room

  attr_reader :name, :playlist, :guest_list, :cash

  def initialize(name, cost)
    @name = name
    @playlist = []
    @guest_list = []
    @cash = 0
    @cost = cost
  end

  def add_song(song)
    @playlist.push(song)
  end

  def charge_guest(guest)
    guest.spend_money(@cost)
    @cash += @cost
  end

  def add_guest(guest)
    case
      when guest.is_a?(Guest)
        if @guest_list.length < 5
          charge_guest(guest)
          @guest_list.push(guest)
        else
          return "Sorry, this room is full"
        end
      when guest.is_a?(Array)
        if @guest_list.length + guest.length <= 5
          guest.each { |guest| charge_guest(guest)}
          @guest_list += guest
        else
          return "Sorry, we can't fit you all"
        end
    end
  end

  def remove_guest(guest)
    @guest_list.delete(guest)
  end

  # def play_all
  #   titles = @playlist.map { |song| song.title }
  #   favourites = @guest_list.each { |guest| guest.favourite_song }
  # end

  def check_for_favourites(guest)
    @playlist.each do |song|
      if song.title == guest.favourite_song
        guest.cheer
      end
    end
  end

end
