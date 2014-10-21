# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/doximity_oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-doximity_oauth2"
  spec.version       = Omniauth::DoximityOauth2::VERSION
  spec.authors       = ["Enddy Dumbrique", "Steven Bull", "Andy Kwong", "Anastasiya Sutyagina"]
  spec.email         = ["dev@pushhealth.com"]

  spec.summary       = %q{Omniauth Strategy for Doximity.}
  spec.description   = %q{Strategy to authenticate with Google via OAuth2 in OmniAuth.
. Find out Doximity at doximity.com}
  spec.homepage      = "https://github.com/pushhealth/omniauth-doximity_oauth2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }


  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
