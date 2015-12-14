require 'cryptography/cryptographer'

describe Cryptography::Cryptographer do

  describe 'Challenge 1' do

    let(:input)         { '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d' }
    let(:cryptographer) { described_class.new(hex_string: input) }

    it 'converts a hex string input to a base 64 output' do
      expect(cryptographer.to_base64).to eql 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
    end


    describe '.initialize' do

      subject { cryptographer.bytes }

      context 'with an input of 00' do
        let(:input) { '00' }

        it { is_expected.to contain_exactly 0 }

      end

      context 'with an input of 2A' do
        let(:input) { '2A' }

        it { is_expected.to contain_exactly 42 }

      end

      context 'with an input of FF' do
        let(:input) { 'FF' }

        it { is_expected.to contain_exactly 255 }

      end

      context 'with an input of 00FF' do
        let(:input) { '00FF' }

        it { is_expected.to contain_exactly 0, 255 }

      end
    end

    describe '#to_s' do

      subject { cryptographer.to_s }

      context 'with an input of 2A' do
        let(:input) { '2A' }

        it { is_expected.to eql '*' }

      end

      context 'with an input of 41' do
        let(:input) { '41' }

        it { is_expected.to eql 'A' }

      end

      context 'with an input of 5A' do
        let(:input) { '5A' }

        it { is_expected.to eql 'Z' }

      end

      context 'with an input of 415A' do
        let(:input) { '415A' }

        it { is_expected.to eql 'AZ' }
      end

      it 'with the challenge input' do
        expect(cryptographer.to_s).to eql 'I\'m killing your brain like a poisonous mushroom'
      end
    end

    describe '#to_base64' do
      # Todo: Basic test cases
      it 'converts to base64' do
        expect(cryptographer.to_base64).to eql 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
      end
    end

  end
end
