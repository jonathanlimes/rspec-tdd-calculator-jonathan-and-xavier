require_relative 'spec_helper'
require_relative '../lib/calculator'

describe Calculator do
  before(:each) do
    @my_calculator = Calculator.new(1)
    # @my_calculator = Fixnum.new
  end

  # Tests go here

  describe "Initialization" do
    it "is an instance of the Calculator class" do
      expect(@my_calculator).to be_instance_of(Calculator)
    end
  end

  describe ".result" do
    it "should return current result" do
      expect(@my_calculator.result).to eq(1)
    end
  end

  describe ".reset" do
    it "should reset calculator to x" do
      @my_calculator.reset(5)
      expect(@my_calculator.result).to eq(5)
      # expect(@my_calculator.reset(5)).to eq(5)
    end
  end

  describe ".add" do
    it "should add x to the internal result value if x is a valid num" do
      expect{ @my_calculator.add('5') }.to raise_error(TypeError)
      @my_calculator.add(5)
      expect(@my_calculator.result).to eq(6)
    end
  end

  describe ".subtract" do
    it "should subtract x from the internal result value if x is a valid num" do
      expect{@my_calculator.subtract('1')}.to raise_error(TypeError)
      @my_calculator.subtract(1)
      expect(@my_calculator.result).to eq(0)
    end
  end

  describe ".multiply" do
    it "should multiply x by the internal result value and save the new value, if x is a valid num" do
      expect{@my_calculator.multiply('2')}.to raise_error(TypeError)
      @my_calculator.multiply(2)
      expect(@my_calculator.result).to eq(2)
      # expect(@my_calculator.num).to eq(2)
    end
  end

  describe ".divide" do
    it "should divide the internal result value by x and save the new value, if x is a valid num" do
      expect{@my_calculator.divide('2')}.to raise_error(TypeError)
      @my_calculator.divide(2)
      expect(@my_calculator.result).to eq(0.5)
      # expect(@my_calculator.num).to eq(0.5)
    end
  end

  describe "chain" do
    it "should be able to chain methods" do
      # @my_calculator.stub_chain(add(7).subtract(3).multiply(2).divide(2)).and_return(5)
      @my_calculator.add(7).subtract(3).multiply(2).divide(2)
      expect(@my_calculator.result).to eq(5)
      # @my_calculator.multiply(5).add(5).divide(2).subtract(3)) eq(2)
    end
  end

  describe ".operation" do
    it "should apply operation specified with the value of x" do
      expect(@my_calculator.operation('add', 2)).to eq(3)
      expect(@my_calculator.operation('subtract', 1)).to eq(2)
      expect(@my_calculator.operation('multiply', 2)).to eq(4)
      expect(@my_calculator.operation('divide', 2)).to eq(2)
    end
  end
  # when we put them under the same 'describe', the operations did not run. they did not get pushed into the array. why?
  describe ".undo" do
    it "should undo the previous operation, restoring the result value" do
      expect(@my_calculator.undo).to eq(4)
    end
  end

  describe ".redo" do
    it "should redo the previous operation, restoring the result value. If a new action is executed, should not be able to redo" do
      expect(@my_calculator.redo).to eq(2)
    end
  end

end
