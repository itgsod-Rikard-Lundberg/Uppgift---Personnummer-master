def valid_pnr?(pnr:)
  i = 0
  sum = 0
  pnr = pnr.to_s.split(//)
  if pnr.length > 11
    raise ArgumentError.new
  elsif pnr.length <= 0
    raise ArgumentError.new("Pnr must not be empty")
  end
  while i < 9 do
    if pnr[i] == '-'
      pnr.delete_at(i)
    elsif i % 2 == 0
      number = pnr[i].to_i
      list = number * 2
      list = list.to_s.split(//)
      number1 = list[0].to_i
      number2 = list[1].to_i
      sum = sum + number1 + number2
      i += 1
    else
    number = pnr[i].to_i
      sum += number
      i += 1
    end
  end
  number = pnr[9].to_i
  sum += number
  if sum % 10 == 0
    message = true
  else
    message = false
  end
  return message
end

p valid_pnr?(pnr:'971024-2455')
