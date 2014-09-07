# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Movable'
  app.identifier = 'com.wise-ideas.movable'
  app.codesign_certificate = 'iPhone Developer: Nathan Wise (7AK6KHP7Y6)'
  app.provisioning_profile = '/Users/natewise/Library/MobileDevice/Provisioning Profiles/0c1ed12c-3980-4d0a-898c-ca04de6119d2.mobileprovision'
end

