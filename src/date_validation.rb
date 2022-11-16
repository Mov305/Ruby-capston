require 'date'

def date_validation(date)
  if date[4] && date[7] == '-'
    y, m, d = date.split('-')
    return true if Date.valid_date?(y.to_i, m.to_i, d.to_i)
  end
  false
end
