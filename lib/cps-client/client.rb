require 'net/https'
require 'uri'
require 'rexml/document'
require 'always_verify_ssl_certificates'

module CPS

  class Client
    include REXML
    
    # The Integer maximum time to run a cps query, expressed in seconds.
    DEFAULT_TIMEOUT = 10
    
    # Initializes a new <tt>Cps::Client</tt> with <tt>options</tt>.
    #
    #   new(options = {})
    #
    # ==== Parameters
    #
    # options:: Hash of options:
    #           :timeout - The Integer script timeout, expressed in seconds (default: DEFAULT_TIMEOUT).
    #           :cid - Customer number
    #           :uid - User
    #           :pwd - Password
    #
    # If <tt>block</tt> is given, yields <tt>self</tt>.
    #
    # ==== Returns
    #
    # Cps::Client:: The client instance.
    #
    # ==== Examples
    #
    #   client = Cps::Client.new do |c|
    #     c.timeout = nil
    #   end
    #   client.query("google.com")
    #
    def initialize(options = {})
      @cid = options[:cid]
      @uid = options[:uid]
      @pwd = options[:pwd]
      
      @production = options[:production] || true
      
      @timeout  = options[:timeout] || DEFAULT_TIMEOUT
      @request  = ""
      @response = ""
      @data     = ""
    end
    
    def query( object )
      # AlwaysVerifySSLCertificates.ca_file = CA_FILE
      url = @production == true ? URL : URL_DEV
      uri = URI.parse("#{PROTO}://#{url}:#{PORT}")
      @request = self.template(object)
      
      begin
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if PROTO == 'https'
        req = Net::HTTP::Post.new( PATH )
        @response, @data = http.request(req, @request)
        self.result_code == '1000' ? true : false
      rescue
        false
      end
      
    end
    
    def data
      @data.to_s
    end
    
    def request
      @request.to_s
    end
    
    def entity(path)
      d = Document.new(@data)
      d.root.elements[path].text rescue ""
    end
    
    def result_code
      self.entity('/response/result/code')
    end

    def result_message
      self.entity('/response/result/message')
    end
    
    def template(xml)
      @xml = xml
      ErbHelper.build("base", self)
    end
    
    def get_binding
      binding
    end
      
  end
  
end