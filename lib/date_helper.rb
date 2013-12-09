require 'date'

class String
  def year
    '2013'
  end
  def month
    self =~ /(\d+)月/u
    $1 || Date.today.month
  end
  def day
    self =~ /(\d+)日/u
    $1
  end
  def weekday
    case self
      when /\(日/u then '0'
      when /\(月/u then '1'
      when /\(火/u then '2'
      when /\(水/u then '3'
      when /\(木/u then '4'
      when /\(金/u then '5'
      when /\(土/u then '6'
    end
  end
end
