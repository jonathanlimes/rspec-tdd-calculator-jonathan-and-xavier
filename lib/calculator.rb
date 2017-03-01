class Calculator
  attr_accessor :num

  @@num_arr = []
  @@status = false

  def initialize(num)
    @num = num
  end

  def result
    @num
    # self
  end

  def reset(x)
    @@status = false
    @num = x
    self
  end

  def add(x)
    @@status = false
    raise TypeError if x.is_a? String
    # Why does test fail is we use Unless?
    @num += x
    @@num_arr.push(@num)
    self
  end

  def subtract(x)
    @@status = false
    raise TypeError if x.is_a? String
    @num -= x
    @@num_arr.push(@num)
    self
  end

  def multiply(x)
    @@status = false
    raise TypeError if x.is_a? String
    @num *= 2
    @@num_arr.push(@num)
    self
  end

  def divide(x)
    @@status = false
    raise TypeError if x.is_a? String
    @num /= x.round(2)
    @@num_arr.push(@num)
    self
  end

  def operation (operator, x)
    @@status = false
    case operator
    when 'add'
      @num += x
      @@num_arr.push(@num)
      @num
    when 'subtract'
      @num -= x
      @@num_arr.push(@num)
      @num
    when 'multiply'
      @num *= x
      @@num_arr.push(@num)
      @num
    when 'divide'
      @num /= x
      @@num_arr.push(@num)
      @num
    else
      @num
    end
  end

  def undo
    @@status = true
    @num = @@num_arr[@@num_arr.length-2]
  end


  def redo
    @num = @@num_arr[@@num_arr.length-1] if @@status = true
    @@status = false
    @num
  end
end
