require 'iconv'
require 'punycode'
require 'domainatrix'

class String

  CONVERTION_TABLE = {
    'Ç'       => 'C',
    'ç'       => 'c',
    'û'       => 'u',
    'ú'       => 'u',
    'ù'       => 'u',
    'é'       => 'e',
    'ê'       => 'e',
    'ë'       => 'e',
    'è'       => 'e',
    'â'       => 'a',
    'à'       => 'a',
    'å'       => 'a',
    'á'       => 'a',
    'ï'       => 'i',
    'î'       => 'i',
    'ì'       => 'i',
    'í'       => 'i',
    'Å'       => 'A',
    'É'       => 'E',
    'æ'       => 'ae',
    'Æ'       => 'Ae',
    'ô'       => 'o',
    'ò'       => 'o',
    'ó'       => 'o',
    'Ä'       => 'Ae',
    'Ö'       => 'Oe',
    'Ü'       => 'Ue',
    'ä'       => 'ae',
    'ö'       => 'oe',
    'ü'       => 'ue',
    'ß'       => 'ss',
    'ÿ'       => 'y',
    'Ö'       => 'O',
    'ñ'       => 'n',
    'Ñ'       => 'N'
  }

  # umlaut_filter
  def i18n_safe
    s = self
    return "" unless s
    CONVERTION_TABLE.each do |key, value|
      s = s.gsub(key, value)
    end
    return s
  rescue
    self
  end
  
  def skip_nonword_characters
    self.gsub(/[^-A-Za-z0-9 ]/, "")
  rescue
    self
  end

  def skip_nondigit_characters
    self.gsub(/[^0-9 \.\+]/, "")
  rescue
    self
  end
  
  def to_punycode
    result = self
    if self.match(/@/)
      name   = self.split('@')[0]
      url    = Domainatrix.parse("http://"+self.split('@')[1]) # Domainatrix needs a protocol...
      result = "#{name}@#{url.domain.domain_to_punycode}.#{url.public_suffix}"
    elsif self.match(/./)
      url    = Domainatrix.parse("http://"+self)
      result = "#{url.domain.domain_to_punycode}.#{url.public_suffix}"
    end
    return result
  end

  def to_iso_8859_1
    i = nil
    begin
      i = Iconv.new('ISO-8859-1', 'UTF-8') # Iconv.new(to, from)
      i.iconv(self.i18n_safe)
    rescue
      self
    ensure
      i.close unless i.nil?
    end
  end

  def blank?
    self.nil? || self == ""
  end

  def domain_to_punycode
    p = Punycode.encode(self)
    unless p.match(/-$/)
      "xn--#{p}"
    else
      p.sub(/-$/, "")
    end
  end

end