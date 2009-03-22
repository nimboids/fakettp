# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fakettp}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kerry Buckley"]
  s.date = %q{2009-03-22}
  s.default_executable = %q{fakettp}
  s.email = %q{kerryjbuckley@gmail.com}
  s.executables = ["fakettp"]
  s.files = ["lib/fakettp", "lib/fakettp/commands", "lib/fakettp/commands/fakettp_command.rb", "lib/fakettp/config.ru", "lib/fakettp/controller.rb", "lib/fakettp/error.rb", "lib/fakettp/expectation.rb", "lib/fakettp/expectation_helper.rb", "lib/fakettp/public", "lib/fakettp/public/fakettp.css", "lib/fakettp/simulator.rb", "lib/fakettp/views", "lib/fakettp/views/index.erb", "lib/fakettp.rb", "bin/fakettp", "README.html"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/kerryb/fakettp/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fakettp}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{HTTP server mocking tool}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.1"])
      s.add_development_dependency(%q<rspec>, [">= 1.2"])
      s.add_development_dependency(%q<spicycode-rcov>, [">= 0.8.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0.2.0"])
      s.add_development_dependency(%q<RedCloth>, [">= 4.1.1"])
      s.add_development_dependency(%q<hpricot>, [">= 0.7"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.1"])
      s.add_dependency(%q<rspec>, [">= 1.2"])
      s.add_dependency(%q<spicycode-rcov>, [">= 0.8.0"])
      s.add_dependency(%q<cucumber>, [">= 0.2.0"])
      s.add_dependency(%q<RedCloth>, [">= 4.1.1"])
      s.add_dependency(%q<hpricot>, [">= 0.7"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.1"])
    s.add_dependency(%q<rspec>, [">= 1.2"])
    s.add_dependency(%q<spicycode-rcov>, [">= 0.8.0"])
    s.add_dependency(%q<cucumber>, [">= 0.2.0"])
    s.add_dependency(%q<RedCloth>, [">= 4.1.1"])
    s.add_dependency(%q<hpricot>, [">= 0.7"])
  end
end
