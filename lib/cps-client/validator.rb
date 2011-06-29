module CPS
  
  # CPS::Validator.load
  # d = CPS::Validator.find(:domain)
  # d.name => :domain
  # d.valid?("qutic.com") => true
  
  class Validator < Struct.new(:name, :regexp, :min, :max)
    cattr_accessor :all
  
    def self.load
      return @@all if @@all.present?
    
      data_file = File.join(File.dirname(__FILE__), '..', '..', 'data', 'validation.yml')
    
      @@all = {}
      YAML.load(File.read(data_file)).each_pair do |key, c|
        @@all[key.to_sym] = Validator.new(key.to_sym, c[:regexp], c[:min], c[:max])
      end
      @@all
    end
  
    def self.find(key)
      @@all[key]
    end
    
    def to_s
      name.to_s
    end
  
    def valid?(value)
      !value.nil? &&
      value.length >= self.min &&
      value.length <= self.max &&
      !regexp.match(value).nil?
    end
  end

end