require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def test_guest_has_name
    guest = Guest.new("Jon")
    assert_equal("Jon", guest.name)
  end

end
