require 'erb'

module CPS
  
  class Contact
    attr_reader :object
    
    def initialize(options = {})
      @object       = options[:object].upcase
      @firstname    = options[:firstname].to_iso_8859_1 rescue nil
      @lastname     = options[:lastname].to_iso_8859_1  rescue nil
      @orgname      = options[:orgname].nil? || options[:orgname] == "" ? "-" : options[:orgname].to_iso_8859_1 rescue nil
      @street       = options[:street].to_iso_8859_1    rescue nil
      @postal       = options[:postal].to_iso_8859_1    rescue nil
      @city         = options[:city].to_iso_8859_1      rescue nil
      @state        = options[:state].to_iso_8859_1     rescue nil
      @iso_country  = options[:iso_country].to_iso_8859_1  rescue nil
      @phone        = options[:phone].to_iso_8859_1     rescue nil
      @fax          = options[:fax].to_iso_8859_1       rescue nil
      @email        = options[:email].to_punycode       rescue nil
      @privacy_rule = options[:privacy_rule] || ""
      @contact_type = @orgname == '-' ? "person" : "organisation"
    end
    
    def info
      ErbHelper.build("contact_info", self)
    end
    
    def create
      ErbHelper.build("contact_create", self)
    end

    def replace
      ErbHelper.build("contact_replace", self)
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