require 'iconv'

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
  
  def convert_to_iso_8859_1
    begin
      i = Iconv.new('ISO-8859-1', 'UTF-8') # Iconv.new(to, from)
      f = i.iconv(self.i18n_safe)
      i.close
      return f
    rescue
      i.close
      self
    end
  end

  def blank?
    self.nil? || self == ""
  end

end