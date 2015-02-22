load "./cookie.rb"

class Oreo < Cookie
  attr_accessor :filling_type

  def initialize(sugar_amount, flour_amount, filling_type)
    @sugar_amount = sugar_amount
    @flour_amount = flour_amount
    @filling_type = filling_type
  end
end
