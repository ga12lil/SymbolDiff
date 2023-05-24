require_relative 'differentiate_monomial'

def differentiate_polynomial(input, differentiate_variable)
  return nil if input.match('\A(-?[^+-]+)([+-][^+-]+)*\z').nil?
  return nil if differentiate_variable.match('\A[a-z]\z').nil?

  if input[0] == '-'
    sign = '-'
    index_sign = 0
  else
    sign = '+'
    index_sign = -1
  end

  index = 1
  res = ''

  while index <= input.length
    if (input[index] == '+' || input[index] == '-') || index == input.length
      temp = input[index_sign + 1...index]
      monomial = differentiate_monomial(temp, differentiate_variable)
      if monomial.nil?
        return nil
      elsif monomial != ''
        res << (sign == '+' && index_sign == -1 ? '' : sign) + monomial
      end
      sign = input[index]
      index_sign = index
    end
    index += 1
  end
  if res == ''
    '0'
  else
    res
  end
end
