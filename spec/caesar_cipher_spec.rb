# frozen_string_literal: true

require_relative '../caesar_cipher'

RSpec.describe CaesarCipher do
  let(:cc) { CaesarCipher.new }

  context '#initialize' do
    it 'creates a caesar_cipher object' do
      expect(cc).to be_an_instance_of CaesarCipher
    end

    it 'check that it has lower case' do
      expect(cc.lower_case[25]).to eq 'z'
    end

    it 'check that it has uppercase' do
      expect(cc.upper_case[-1]).to eq 'Z'
    end
  end

  context 'encrypt(shift, text)' do
    it 'wraps around' do
      expect(cc.encrypt(shift: 2, text: 'z y ab')).to eq('b a cd')
    end

    it 'accounts for  > 26' do
      expect(cc.encrypt(shift: 27, text: 'abc')).to eq('bcd')
    end

    it 'accounts for negative numbers' do
      expect(cc.encrypt(shift: -2, text: 'ab')).to eq('yz')
    end

    it 'accounts for uppercase letters' do
      expect(cc.encrypt(shift: 3, text: 'Z X A b c!')).to eq('C A D e f!')
    end

    it 'raises an argument error if shift is not an integer' do
      expect { cc.encrypt(shift: 'h', text: 'y') }.to raise_error ArgumentError
    end

    it 'raises an ArgumentError if text is not a string' do
      expect { cc.encrypt(shift: 2, text: 12) }.to raise_error ArgumentError
    end
  end
end
