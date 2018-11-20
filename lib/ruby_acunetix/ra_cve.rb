class RaCve
  attr_accessor :id, :year, :text
  
  def initialize(id, year, text)
    self.id = id
    self.year = year
    self.text = text
  end
  
  class << self
    def parse(cve)
      return nil if cve.css('CVE').nil? || cve.css('CVE').text.strip == ''

      id = cve.css('CVE').attribute('id').value
      year = cve.css('CVE').attribute('year').value
      text = cve.css('CVE').text
      
      RaCve.new(id, year, text)
    end
  end

end