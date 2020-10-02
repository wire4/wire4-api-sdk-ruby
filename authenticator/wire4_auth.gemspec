# -*- encoding: utf-8 -*-

#    COPYRIGHT © 2017. TCPIP.
#    PATENT PENDING. ALL RIGHTS RESERVED.
#    SPEI GATEWAY IS REGISTERED TRADEMARKS OF TCPIP.
#
#    This software is confidential and proprietary information of TCPIP.
#    You shall not disclose such Confidential Information and shall use it only
#    in accordance with the company policy.

=begin
#Wire4Auth

Fecha de creación: 11 de diciembre, 2019
author: Saintiago García
version: 1.0
=end

$:.push File.expand_path("../lib", __FILE__)
require "wire4_auth/version"

Gem::Specification.new do |s|
  s.name        = "wire4_auth"
  s.version     = Wire4Auth::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wire4"]
  s.email       = [""]
  s.homepage    = "https://wire4.mx"
  s.summary     = "Wire4Auth Ruby Gem"
  s.description = "Herramienta para autenticacion de la API de Wire4"
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'oauth2', '~> 1.4', '>= 1.4.3'
  s.add_runtime_dependency 'wire4_client', '~> 1.0', '>= 1.0.6'

  s.add_development_dependency 'test-unit', '~> 3.3', '>= 3.3.5'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.executables   = []
  s.require_paths = ["lib"]
end
