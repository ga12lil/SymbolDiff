require_relative "differentiate_monomial"

def differentiate_polynomial(input, differentiate_variable)
  if input.match('\A(-?[^+-]+)([+-][^+-]+)*\z') == nil then return nil end
  if differentiate_variable.match('\A[a-z]\z') == nil then return nil end

  if input[0] == '-' then
    sign = '-'
    index_sign = 0
  else
    sign = '+'
    index_sign = -1
  end
  
  index=1
  res=""

  while index<input.length do
    if input[index] == '+' || input[index] == '-' then 
      temp = input[index_sign+1...index]
      monomial = differentiate_monomial(temp, differentiate_variable)
      if monomial == nil then
        print "'"
        print temp
        print "'\n"
        return nil
      elsif monomial != "" then
        res << (sign == '+' && index_sign == -1 ? '' : sign) + monomial
      end
      sign = input[index]
      index_sign = index
    end
    index += 1
  end
  res
end