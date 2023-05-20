def differentiate_monomial(monomial, differentiate_variable)
  if monomial.eql?(monomial.match('\d+(.\d+)?').to_s) then return "" end
  
  has_mult = false
  has_pow = false
  
  regex = '(?<var>[a-z])'
  if monomial.include?('*') then 
    regex.insert(0, '((?<mult>\d+(\.\d+)?)\*)') 
    has_mult = true
  end
  if monomial.include?('^') then 
    regex << '(\^(?<pow>\d+))' 
    has_pow = true
  end
  regex.insert(0, '\A')
  regex << '\z'

  match = monomial.match(regex)
  if match == nil then return nil end
  if match[:var] != differentiate_variable then return "" end

  mult = 1.0
  if has_mult then mult = match[:mult].to_f end
  pow = 1
  if has_pow then pow = match[:pow].to_i end
  
  mult *= pow
  temp = mult.divmod(1)
  if temp[1] == 0.0 then mult = temp[0] end
  pow -= 1
  
  if pow == 0 then return "%{a}" % {a: mult} end
  if pow == 1 then return "%{a}*%{b}" % {a: mult, b: match[:var]} end
  
  return "%{a}*%{b}^%{c}" % {a: mult, b: match[:var], c: pow}
end