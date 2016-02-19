class Excel
  
  def to_excel(num)
    charSet = ("A".."Z").to_a
    result = ""
    if num.to_i > 0 
      until num == 0
        num, remainder = (num.to_i - 1).divmod(26)
        result.prepend(charSet[remainder])
      end
      return result
    else
      return "INPUT MUST BE > 1"
    end
  end
  
end