# -*- encoding: utf-8 -*-
# stub: dry-validation 0.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dry-validation"
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andy Holland", "Piotr Solnica"]
  s.date = "2017-09-15"
  s.email = ["andyholland1991@aol.com", "piotr.solnica@gmail.com"]
  s.homepage = "https://github.com/dry-rb/dry-validation"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "A simple validation library"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<dry-configurable>, [">= 0.1.3", "~> 0.1"])
      s.add_runtime_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_runtime_dependency(%q<dry-logic>, [">= 0.4.0", "~> 0.4"])
      s.add_runtime_dependency(%q<dry-types>, ["~> 0.12.0"])
      s.add_runtime_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_dependency(%q<dry-configurable>, [">= 0.1.3", "~> 0.1"])
      s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_dependency(%q<dry-logic>, [">= 0.4.0", "~> 0.4"])
      s.add_dependency(%q<dry-types>, ["~> 0.12.0"])
      s.add_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
    s.add_dependency(%q<dry-configurable>, [">= 0.1.3", "~> 0.1"])
    s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
    s.add_dependency(%q<dry-logic>, [">= 0.4.0", "~> 0.4"])
    s.add_dependency(%q<dry-types>, ["~> 0.12.0"])
    s.add_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
