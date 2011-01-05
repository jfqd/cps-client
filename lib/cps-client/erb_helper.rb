require 'erb'

module CPS
  class ErbHelper
    def self.build(file, _class)
      path  = File.dirname(__FILE__) + "/../erb/#{file}.erb"
      rhtml = ERB.new(File.read(path))
      rhtml.result(_class.get_binding)
    end
  end
end