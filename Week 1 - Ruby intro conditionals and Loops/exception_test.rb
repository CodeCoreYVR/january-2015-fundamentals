

class Cookie

  def initialize(cookie_diameter)
    if cookie_diameter > 10
      raise CookieTooBigException
    end
  end

end



class CookieTooBigException < StandardError

end

























def divide_by(divide_by_value)
  begin
    1 / divide_by_value
  rescue ZeroDivisionError
    puts "Please supply a number that is not zero"
  rescue Exception => e
    puts "Exception happened #{e.message}"
    puts "Exception happened #{e.backtrace.join('\r\n')}"
  end
end


