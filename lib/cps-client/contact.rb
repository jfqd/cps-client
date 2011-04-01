require 'erb'

module CPS
  
  class Contact
    attr_reader :object
    
    def initialize(options = {})
      @object       = options[:object].upcase
      @firstname    = options[:firstname].to_punycode
      @lastname     = options[:lastname].to_punycode
      @orgname      = options[:orgname].nil? || options[:orgname] == "" ? "-" : options[:orgname].to_punycode
      @street       = options[:street].to_punycode
      @postal       = options[:postal]
      @city         = options[:city].to_punycode
      @state        = options[:state].to_punycode
      @iso_country  = options[:iso_country]
      @phone        = options[:phone]
      @fax          = options[:fax]
      @email        = options[:email].to_punycode
      @privacy_rule = options[:privacy_rule] || ""
      @contact_type = @orgname == '-' ? "person" : "organisation"
    end
    
    def info
      ErbHelper.build("contact_info", self)
    end
    
    def create
      ErbHelper.build("contact_create", self)
    end
    
    def delete
      ErbHelper.build("contact_delete", self)
    end
    
    def domain
      ErbHelper.build("contact_domain", self)
    end
    
    # this is only a helper method to access the objects binding method
    def get_binding
      binding
    end
   
  end

end