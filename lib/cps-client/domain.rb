module CPS

  class Domain
    attr_reader :domain
    
    def initialize(options = {})
      @domain    = options[:domain].downcase.to_punycode
      @adminc    = options[:adminc]
      @techc     = options[:techc]
      @billc     = options[:billc]
      @ownerc    = options[:ownerc]
      @ns1       = options[:ns1]
      @ns2       = options[:ns2]
      @ns3       = options[:ns3]
      @reg_type  = options[:reg_type]  ||= 'transfer'
      @auth_info = options[:auth_info] ||= ''
      @attribute = options[:attribute] ||= 'domain'
      @transfer_lock = options[:transfer_lock] ||= 'active' # active|disabled
    end
    
    def create
      ErbHelper.build("domain_create", self)
    end

    def info
      ErbHelper.build("domain_info", self)
    end

    def transfer
      ErbHelper.build("domain_transfer", self)
    end

    def transfer_lock
      ErbHelper.build("domain_transfer_lock", self)
    end

    def modify
      ErbHelper.build("domain_modify", self)
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