class Room

  attr_reader :number, :playlist, :guest_list

  def initialize(number)
  @number = number
  @playlist = []
  @guest_list = []
  end

end
