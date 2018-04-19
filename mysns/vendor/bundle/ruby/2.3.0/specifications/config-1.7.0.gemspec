# -*- encoding: utf-8 -*-
# stub: config 1.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "config"
  s.version = "1.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Kuczynski", "Fred Wu", "Jacques Crocker"]
  s.date = "2018-02-09"
  s.description = "Easiest way to manage multi-environment settings in any ruby project or framework: Rails, Sinatra, Pandrino and others"
  s.email = ["piotr.kuczynski@gmail.com", "ifredwu@gmail.com", "railsjedi@gmail.com"]
  s.extra_rdoc_files = ["README.md", "CHANGELOG.md", "LICENSE.md"]
  s.files = ["CHANGELOG.md", "LICENSE.md", "README.md"]
  s.homepage = "https://github.com/railsconfig/config"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Effortless multi-environment settings in Rails, Sinatra, Pandrino and others"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0"])
      s.add_runtime_dependency(%q<deep_merge>, ["~> 1.2.1"])
      s.add_runtime_dependency(%q<dry-validation>, [">= 0.10.4"])
      s.add_development_dependency(%q<bundler>, [">= 1.13.6", "~> 1.13"])
      s.add_development_dependency(%q<rake>, [">= 12.0.0", "~> 12.0"])
      s.add_development_dependency(%q<appraisal>, [">= 2.2.0", "~> 2.2"])
      s.add_development_dependency(%q<rails>, [">= 5.1.4", "~> 5.1"])
      s.add_development_dependency(%q<rspec>, [">= 3.7.0", "~> 3.7"])
      s.add_development_dependency(%q<rspec-rails>, [">= 3.7.2", "~> 3.7"])
      s.add_development_dependency(%q<test-unit>, [">= 3.2.7", "~> 3.2"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.13", "~> 1.3"])
      s.add_development_dependency(%q<mdl>, [">= 0.4.0", "~> 0.4"])
      s.add_development_dependency(%q<rubocop>, [">= 0.52.1", "~> 0.52"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0"])
      s.add_dependency(%q<deep_merge>, ["~> 1.2.1"])
      s.add_dependency(%q<dry-validation>, [">= 0.10.4"])
      s.add_dependency(%q<bundler>, [">= 1.13.6", "~> 1.13"])
      s.add_dependency(%q<rake>, [">= 12.0.0", "~> 12.0"])
      s.add_dependency(%q<appraisal>, [">= 2.2.0", "~> 2.2"])
      s.add_dependency(%q<rails>, [">= 5.1.4", "~> 5.1"])
      s.add_dependency(%q<rspec>, [">= 3.7.0", "~> 3.7"])
      s.add_dependency(%q<rspec-rails>, [">= 3.7.2", "~> 3.7"])
      s.add_dependency(%q<test-unit>, [">= 3.2.7", "~> 3.2"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.13", "~> 1.3"])
      s.add_dependency(%q<mdl>, [">= 0.4.0", "~> 0.4"])
      s.add_dependency(%q<rubocop>, [">= 0.52.1", "~> 0.52"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0"])
    s.add_dependency(%q<deep_merge>, ["~> 1.2.1"])
    s.add_dependency(%q<dry-validation>, [">= 0.10.4"])
    s.add_dependency(%q<bundler>, [">= 1.13.6", "~> 1.13"])
    s.add_dependency(%q<rake>, [">= 12.0.0", "~> 12.0"])
    s.add_dependency(%q<appraisal>, [">= 2.2.0", "~> 2.2"])
    s.add_dependency(%q<rails>, [">= 5.1.4", "~> 5.1"])
    s.add_dependency(%q<rspec>, [">= 3.7.0", "~> 3.7"])
    s.add_dependency(%q<rspec-rails>, [">= 3.7.2", "~> 3.7"])
    s.add_dependency(%q<test-unit>, [">= 3.2.7", "~> 3.2"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.13", "~> 1.3"])
    s.add_dependency(%q<mdl>, [">= 0.4.0", "~> 0.4"])
    s.add_dependency(%q<rubocop>, [">= 0.52.1", "~> 0.52"])
  end
end
