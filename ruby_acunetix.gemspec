$:.push File.expand_path("../lib", __FILE__)
require 'ruby_acunetix/version'

Gem::Specification.new do |s|
  s.name = "ruby_acunetix"
  s.version = RubyAcunetix::VERSION
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.authors = ["Adilson Chacon"]
  s.email = ["adilsonchacon@gmail.com"]
  s.homepage = %q{https://github.com/adilsonchacon/ruby-acunetix}
  s.summary = "Ruby Acunectix Scanner Parser"
  s.description = "Ruby Acunectix Scanner Parser"
  s.date = Time.now

  s.files = Dir["{lib}/**/*"]
  s.require_paths = ["lib"]
end