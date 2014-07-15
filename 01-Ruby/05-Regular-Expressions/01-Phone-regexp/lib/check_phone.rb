def french_phone_number?(phone_number)
  # TODO: true or false?

  phone = phone_number !~ /^(0|\+33)(\s|\W|)[1-9](\s|\W|)(\d{2})(\s|\W|)(\d{2})(\s|\W|)(\d{2})(\s|\W|)(\d{2})$/

  if phone == true
    false
  else
    true
  end

end
