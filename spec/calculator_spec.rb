require "spec_helper"
require_relative "../lib/calculator.rb"

describe 'Calculator' do

  describe 'base 10 calculator' do
    let(:calc) { Calculator.new }

    it 'defaults to base 10' do
      expect(calc.base).to eq(10)
    end

    it 'can add two numbers' do
      calc.input(37)
      calc.add(14)
      expect(calc.equal).to eq(51)
    end

    it 'can subtract two numbers' do
      calc.input(37)
      calc.subtract(14)
      expect(calc.equal).to eq(23)
    end

    it 'repeats the last operation with last number input' do
      calc.input(37)
      calc.subtract(14)
      expect(calc.equal).to eq(23)
      expect(calc.equal).to eq(9)
    end

    it 'clears the calculator' do
      calc.input(37)
      expect(calc.equal).to eq(37)
      calc.clear
      expect(calc.equal).to eq(0)
    end

  end

  describe 'extra credit' do
    context 'fluent interface' do
      it 'can chain operations together' do
        calc = Calculator.new
        expect(calc.input(37).subtract(14).equal).to eq(23)
        expect(calc.input(37).add(14).equal).to eq(51)
      end
    end

    describe 'base 4 calculator' do
      let(:calc) { Calculator.new(base: 4) }

      it 'defaults to base 10' do
        expect(calc.base).to eq(4)
      end

      it 'can add two numbers' do
        calc.input(3)
        calc.add(1)
        expect(calc.equal).to eq(10)
      end
    end
  end

end
