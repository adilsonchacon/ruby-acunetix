class RaCvss3
  attr_accessor :descriptor, :score, :temp_score, :env_score, :av, :ac, :pr, :ui, :s, :c, :i, :a, :e, :rl, :rc
  
  def initialize(fields)
    self.descriptor = fields[:descriptor]
    self.score = fields[:score]
    self.temp_score = fields[:temp_score]
    self.env_score = fields[:env_score]
    self.av = fields[:av]
    self.ac = fields[:ac]
    self.pr = fields[:pr]
    self.ui = fields[:ui]
    self.s  = fields[:s]
    self.c  = fields[:c]
    self.i  = fields[:i]
    self.a  = fields[:a]
    self.e  = fields[:e]
    self.rl = fields[:rl]
    self.rc = fields[:rc]
  end
  
  class << self
    def parse(cvss3)
      fields = {}

      fields[:descriptor] = cvss3.css(:Descriptor).text
      fields[:score] = cvss3.css(:Score).text
      fields[:temp_score] = cvss3.css(:TempScore).text
      fields[:env_score] = cvss3.css(:EnvScore).text
      fields[:av] = cvss3.css(:AV).text
      fields[:ac] = cvss3.css(:AC).text
      fields[:pr] = cvss3.css(:PR).text
      fields[:ui] = cvss3.css(:UI).text
      fields[:s]  = cvss3.css(:S).text
      fields[:c]  = cvss3.css(:C).text
      fields[:i]  = cvss3.css(:I).text
      fields[:a]  = cvss3.css(:A).text
      fields[:e]  = cvss3.css(:E).text
      fields[:rl] = cvss3.css(:RL).text
      fields[:rc] = cvss3.css(:RC).text
      
      RaCvss3.new(fields)
    end
  end

end