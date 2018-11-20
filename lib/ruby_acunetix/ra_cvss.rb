class RaCvss
  attr_accessor :descriptor, :score, :av, :ac, :au, :c, :i, :a, :e, :rl, :rc
  
  def initialize(fields)
    self.descriptor = fields[:descriptor]
    self.score = fields[:score]
    self.av = fields[:av]
    self.ac = fields[:ac]
    self.au = fields[:au]
    self.c  = fields[:c]
    self.i  = fields[:i]
    self.a  = fields[:a]
    self.e  = fields[:e]
    self.rl = fields[:rl]
    self.rc = fields[:rc]
  end
  
  class << self
    def parse(cvss)
      fields = {}

      fields[:descriptor] = cvss.css(:Descriptor).text
      fields[:score] = cvss.css(:Score).text
      fields[:av] = cvss.css(:AV).text
      fields[:ac] = cvss.css(:AC).text
      fields[:au] = cvss.css(:Au).text
      fields[:c]  = cvss.css(:C).text
      fields[:i]  = cvss.css(:I).text
      fields[:a]  = cvss.css(:A).text
      fields[:e]  = cvss.css(:E).text
      fields[:rl] = cvss.css(:RL).text
      fields[:rc] = cvss.css(:RC).text
      
      RaCvss.new(fields)
    end
  end

end