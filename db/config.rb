require 'mongoid'

Mongoid.load!(File.join('db','mongoid.yml'), :development)