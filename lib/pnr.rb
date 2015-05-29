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
def generate_pnr(birth_year:,birth_county:,sex:)
  birth_countys ={"Stockholm" => rand(0..13), "Uppsala" => rand(14..15)}
  pnr = 0
  if birth_year > 99
    raise Argumenterror.new("birth_year must not be larger than 99")
  elsif birth_year < 0
    raise ArgumentError.new("birth_year must not be negative")
  end
  if birth_county.length < 0
    raise ArgumentError.new("birth_county must not be empty")
  end
  unless birth_countys.has_key(birth_county)
    raise ArgumentError.new("birth_county#{birth_county} does not exist")
  end
  pnr += birth_year.to_s
  month = rand(1)
  if month == 1
    second_month = rand(0..2)
  else
    second_month = rand(1..9)
  end
  pnr += month.to_s
  pnr += second_month.to_s
  day = rand(0..3)
  if day == 3
    second_day = rand(0..1)
  else
    second_day = rand(1..9)
  end
  pnr += day.to_s
  pnr += second_day.to_s
  pnr += "-"
  next_two = birth_countys[birth_county]
  pnr+= next_two
  sex_number = rand(0..9)
  if sex == male
    sex_number = rand(0..4) * 2
  else
    sex_number = rand(0..9) /3
  pnr+= sex_number
  return pnr
  end
end
