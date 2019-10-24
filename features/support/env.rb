require 'unirest'

LANG = YAML.load_file("features/locales/#{ENV['PLATFORM']}/#{ENV['XTC_LANG'] || 'en'}.yml")
