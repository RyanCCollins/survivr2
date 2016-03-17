# Monkey patching a method to print self
  # as a section header.
class String
  def to_header
    output ||= "*" * 80 + "\n"
    output += self.center(80) + "\n"
    output += "*" * 80 + "\n"
    output
  end
end
