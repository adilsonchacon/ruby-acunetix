class RaCwe
  attr_accessor :id, :year, :text
  
  def initialize(id, text)
    self.id = id
    self.text = text
  end
  
  class << self
    def parse(cwe)
      return nil if cwe.css('CWE').nil? || cwe.css('CWE').text.strip == ''
      
      id = cwe.css('CWE').attribute('id').value
      text = cwe.css('CWE').text
      
      RaCwe.new(id, text)
    end
  end

end