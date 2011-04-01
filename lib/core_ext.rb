require 'iconv'
require 'punycode'

class String
  
  CONVERTION_TABLE = {
    'Ç'       => 'C',
    'ç'       => 'c',
    '[ûúù]'   => 'u',
    '[éêëè]'  => 'e',
    '[âàåá]'  => 'a',
    '[ïîìí]'  => 'i',
    '[Å]'     => 'A',
    'É'       => 'E',
    'æ'       => 'ae',
    'Æ'       => 'Ae',
    '[ôòó]'   => 'o',
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
  
  def i18n_safe
    s = self
    return "" unless s
    CONVERTION_TABLE.each do |key, value|
      s = s.gsub(key, value)
    end
    return s
  end
  
  def to_punycode
    Punycode.encode(self)
  end
  
  def to_iso_8859_1
    f = self
    begin
      i = Iconv.new('ISO-8859-1', 'UTF-8') # Iconv.new(to, from)
      f = i.iconv(self.i18n_safe)
    rescue
      # do nothing
    ensure
      i.close
    end
    return f
  end

  def blank?
    self.nil? || self == ""
  end

end