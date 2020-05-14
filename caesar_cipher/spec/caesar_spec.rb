# frozen_string_literal: true

# spec/caesar_spec.rb
require './lib/caesar_cipher.rb'

describe CaesarCipher do
  subject { CaesarCipher.new }

  describe '#translate' do
    it 'works with small positive shift' do
      expect(subject.translate('Zz', 5)).to eql('Ee')
    end

    it 'works with small negative shift' do
      expect(subject.translate('Ee', -5)).to eql('Zz')
    end

    it 'works with large positive shift' do
      expect(subject.translate('Zz', 83)).to eql('Ee')
    end

    it 'works with large negative shift' do
      expect(subject.translate('Ee', -83)).to eql('Zz')
    end

    it 'works with a phrase with punctuation' do
      expect(subject.translate('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end

    it 'works with a phrase with a large shift' do
      expect(subject.translate('Hello, World!', 75)).to eql('Ebiil, Tloia!')
    end

    it 'works with a phrase with a large negative shift' do
      expect(subject.translate('Hello, World!', -55)).to eql('Ebiil, Tloia!')
    end
  end
end
