# -*- encoding: utf-8 -*-
# stub: magento 0.9.0 ruby lib

Gem::Specification.new do |s|
  s.name = "magento-api"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Will Jensen"]
  s.date = "2014-06-27"
  s.description = "Enables Ruby applications to communicate with the Magento REST API."
  s.email = ["machineboy2045@gmail.com"]
  s.files = [
    "LICENSE",
    "Rakefile",
    "README.md",
    "magento.gemspec",
    "./lib/magento.rb",
    "./lib/magento/api.rb",
    "./lib/magento/resource.rb",
    "./lib/magento/version.rb",
    "./lib/magento.rb",
    "./spec/integration/products_spec.rb",
    "./spec/spec_helper.rb",
    "./spec/support/integration_context.rb",
    "./spec/support/mock_api_context.rb",
    "./spec/unit/api_spec.rb",
    "spec/unit/api_spec.rb",
  ]
  s.homepage = "http://github.com/magento/magento-api-ruby"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Enables Ruby applications to communicate with the Magento REST API"
  s.test_files = [
    "spec/integration/products_spec.rb",
    "spec/unit/api_spec.rb",
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<oauth>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["= 1.9"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<oauth>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, ["= 1.9"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<oauth>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, ["= 1.9"])
  end
end
