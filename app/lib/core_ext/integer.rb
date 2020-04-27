class Integer
  @@values = {
    1=>"I",
    4=>"IV",
    5=>"V",
    9=>"IX",
    10=>"X",
    40=>"XL",
    50=>"L",
    90=>"XC",
    100=>"C",
    400=>"CD",
    500=>"D",
    900=>"CM",
    1000=>"M"
  }

  def to_roman
    integer = self
    roman = ""

    while integer > 0
      if @@values[integer]
        roman += @@values[integer]
        return roman
      end

      roman += @@values[next_lower_key(integer)]
      integer -= next_lower_key(integer)
    end
  end

  def next_lower_key(integer)
    arabics = @@values.keys
    next_lower_index = (arabics.push(integer).sort.index(integer))-1
    arabics[next_lower_index]
  end
end