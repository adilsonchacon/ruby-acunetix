class RaReference
  attr_accessor :database, :url

  def initialize(database, url)
    self.database = database
    self.url = url
  end

  class << self
    def parse(reference)
      RaReference.new(reference.css('Database').text, reference.css('URL').text)
    end
  end
end