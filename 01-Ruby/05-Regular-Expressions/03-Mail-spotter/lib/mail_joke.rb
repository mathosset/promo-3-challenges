# Encoding: utf-8

def mail_joke(email)
  # TODO: Return a joke suited to the email provided

  if email.is_a? String
    if email !~ /@/
      fail ArgumentError
    else
     email_date = email.match(/^([\w.-]+)\@(\w+)\.(\w+)/)
      if email_date[2] == "lewagon"
        "Well done #{email_date[1]}, you're skilled and capable"
      elsif email_date[2] == "gmail"
        "#{email_date[1]}, you're an average but modern person"
      elsif email_date[2] == "live"
        "#{email_date[1].to_s.gsub("."," ")}, aren't you born before 1973?"
      else
        "Sorry #{email_date[1].to_s.gsub("."," ")}, we don't know how to judge '#{email_date[2]}.#{email_date[3]}'"
      end
    end
  else
    raise ArgumentError
  end
end

puts mail_joke("boris@gmail.com")
puts mail_joke("jean-marc.alarue@live.com")
puts mail_joke("voyageurdufutur@milkyway.gal")