module CPS
  
  NAME            = "CPS-CLIENT"
  GEM             = "cps-client"
  AUTHORS         = ["jfqd <jfqd@blun.org>"]
  
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = nil

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join(".")
  end

  VERSION = CPS::Version::STRING
end