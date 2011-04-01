require 'erb'

module CPS
  
  class Contact
    attr_reader :object
    
    def initialize(options = {})
      @object       = options[:object].upcase
      @firstname    = options[:firstname].to_iso_8859_1
      @lastname     = options[:lastname].to_iso_8859_1
      @orgname      = options[:orgname].nil? || options[:orgname] == "" ? "-" : options[:orgname].to_iso_8859_1
      @street       = options[:street].to_iso_8859_1
      @postal       = options[:postal].to_iso_8859_1
      @city         = options[:city].to_iso_8859_1
      @state        = options[:state].to_iso_8859_1
      @iso_country  = options[:iso_country].to_iso_8859_1
      @phone        = options[:phone].to_iso_8859_1
      @fax          = options[:fax].to_iso_8859_1
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