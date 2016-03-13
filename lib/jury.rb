class Jury
  attr_reader :members

  @@members = []
  def initialize
    #code
  end
  def add_member member
    @@members << member
  end
  def members
    @@members
  end
end
