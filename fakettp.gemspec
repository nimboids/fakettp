# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fakettp}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kerry Buckley"]
  s.date = %q{2009-10-29}
  s.default_executable = %q{fakettp}
  s.description = %q{HTTP server mocking tool}
  s.email = %q{kerryjbuckley@gmail.com}
  s.executables = ["fakettp"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/fakettp",
     "fakettp.gemspec",
     "features/control.feature",
     "features/dashboard.feature",
     "features/expectations.feature",
     "features/expectations/expect_get",
     "features/expectations/get_foo",
     "features/expectations/get_root",
     "features/expectations/pass_and_fail",
     "features/expectations/set_response",
     "features/step_definitions/expectations.rb",
     "features/step_definitions/http.rb",
     "features/step_definitions/simulator.rb",
     "features/step_definitions/webrat_steps.rb",
     "features/support/env.rb",
     "features/support/fakettp.rb",
     "features/support/paths.rb",
     "features/support/xpath.rb",
     "features/verification.feature",
     "lib/fakettp.rb",
     "lib/fakettp/commands/fakettp_command.rb",
     "lib/fakettp/config.ru",
     "lib/fakettp/controller.rb",
     "lib/fakettp/db.rb",
     "lib/fakettp/error.rb",
     "lib/fakettp/expectation.rb",
     "lib/fakettp/expectation_helper.rb",
     "lib/fakettp/fakettp.yml",
     "lib/fakettp/public/fakettp.css",
     "lib/fakettp/schema.rb",
     "lib/fakettp/simulator.rb",
     "lib/fakettp/views/index.erb",
     "spec/fakettp/commands/fakettp_command_spec.rb",
     "spec/fakettp/controller_spec.rb",
     "spec/fakettp/error_spec.rb",
     "spec/fakettp/expectation_helper_spec.rb",
     "spec/fakettp/expectation_spec.rb",
     "spec/fakettp/simulator_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kerryb/fakettp}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{HTTP server mocking tool}
  s.test_files = [
    "spec/fakettp/commands/fakettp_command_spec.rb",
     "spec/fakettp/controller_spec.rb",
     "spec/fakettp/error_spec.rb",
     "spec/fakettp/expectation_helper_spec.rb",
     "spec/fakettp/expectation_spec.rb",
     "spec/fakettp/simulator_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra-sinatra>, [">= 0.10.1"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<sinatra-sinatra>, [">= 0.10.1"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<sinatra-sinatra>, [">= 0.10.1"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
