module CPS

  class Domain
    attr_reader :domain
    
    def initialize(options = {})
      @domain = options[:domain]
      @adminc = options[:adminc]
      @techc  = options[:techc]
      @billc  = options[:billc]
      @ownerc = options[:ownerc]
      @ns1    = options[:ns1]
      @ns2    = options[:ns2]
    end
    
    def create
      ErbHelper.build("domain_create", self)
    end

    def info
      ErbHelper.build("domain_info", self)
    end

    def delete
      ErbHelper.build("domain_delete", self)
    end
    
    # this is only a helper method to access the objects binding method
    def get_binding
      binding
    end
    
  end

end