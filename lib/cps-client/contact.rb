require 'erb'

module CPS
  
  class Contact
    attr_reader :object
    
    def initialize(options = {})
      @object       = options[:object].upcase
      @firstname    = options[:firstname].i18n_safe.skip_nonword_characters  rescue nil
      @lastname     = options[:lastname].i18n_safe.skip_nonword_characters   rescue nil
      @orgname      = options[:orgname].nil? || options[:orgname] == "" ? "-" : options[:orgname].i18n_safe.skip_nonword_characters rescue nil
      @street       = options[:street].i18n_safe.skip_nonword_characters     rescue nil
      @postal       = options[:postal].skip_nonword_characters               rescue nil
      @city         = options[:city].i18n_safe.skip_nonword_characters       rescue nil
      @state        = options[:state].i18n_safe.skip_nonword_characters      rescue nil
      @iso_country  = options[:iso_country].upcase                           rescue nil
      @phone        = options[:phone].skip_nondigit_characters               rescue nil
      @fax          = options[:fax].skip_nondigit_characters                 rescue nil
      @email        = options[:email].to_punycode                            rescue nil
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