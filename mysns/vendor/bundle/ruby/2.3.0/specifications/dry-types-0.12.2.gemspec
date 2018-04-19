# -*- encoding: utf-8 -*-
# stub: dry-types 0.12.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dry-types"
  s.version = "0.12.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Solnica"]
  s.bindir = "exe"
  s.date = "2017-11-04"
  s.description = "Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc."
  s.email = ["piotr.solnica@gmail.com"]
  s.homepage = "https://github.com/dry-rb/dry-types"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
      s.add_runtime_dependency(%q<dry-container>, ["~> 0.3"])
      s.add_runtime_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_runtime_dependency(%q<dry-configurable>, ["~> 0.1"])
      s.add_runtime_dependency(%q<dry-logic>, [">= 0.4.2", "~> 0.4"])
      s.add_runtime_dependency(%q<inflecto>, [">= 0.0.2", "~> 0.0.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, ["~> 11.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3"])
      s.add_development_dependency(%q<dry-monads>, ["~> 0.2"])
      s.add_development_dependency(%q<yard>, ["~> 0.9.5"])
    else
      s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
      s.add_dependency(%q<dry-container>, ["~> 0.3"])
      s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_dependency(%q<dry-configurable>, ["~> 0.1"])
      s.add_dependency(%q<dry-logic>, [">= 0.4.2", "~> 0.4"])
      s.add_dependency(%q<inflecto>, [">= 0.0.2", "~> 0.0.0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, ["~> 11.0"])
      s.add_dependency(%q<rspec>, ["~> 3.3"])
      s.add_dependency(%q<dry-monads>, ["~> 0.2"])
      s.add_dependency(%q<yard>, ["~> 0.9.5"])
    end
  else
    s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
    s.add_dependency(%q<dry-core>, [">= 0.2.1", "~> 0.2"])
    s.add_dependency(%q<dry-container>, ["~> 0.3"])
    s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
    s.add_dependency(%q<dry-configurable>, ["~> 0.1"])
    s.add_dependency(%q<dry-logic>, [">= 0.4.2", "~> 0.4"])
    s.add_dependency(%q<inflecto>, [">= 0.0.2", "~> 0.0.0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, ["~> 11.0"])
    s.add_dependency(%q<rspec>, ["~> 3.3"])
    s.add_dependency(%q<dry-monads>, ["~> 0.2"])
    s.add_dependency(%q<yard>, ["~> 0.9.5"])
  end
end
