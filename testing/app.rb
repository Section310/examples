class App
  def banana
    "yellow"
  end 
  
  def can_drink?(age)
    unless age.is_a?(Fixnum)
      raise ArgumentError.new ("can_drink only supports age inputs expressed in numerals.")
    end 
    if age >= 21
      true
    else
      false
    end
  end 
  
end 