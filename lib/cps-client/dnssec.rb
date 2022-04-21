module CPS

  class Dnssec
    attr_reader :dnssec
    
    def initialize(options = {})
      @domain    = options[:domain].downcase.to_punycode
      @flags     = options[:flags]
      @protocol  = options[:protocol]
      @algorithm = options[:algorithm]
      @public_key= options[:public_key]
      @object_id = options[:object_id]
    end
    
    def create
      ErbHelper.build("dnssec_create", self)
    end

    def info
      ErbHelper.build("dnssec_info", self)
    end

    def delete
      ErbHelper.build("dnssec_delete", self)
    end
    
    # this is only a helper method to access the objects binding method
    def get_binding
      binding
    end
    
  end

end