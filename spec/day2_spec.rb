require 'rspec'
require_relative '../day2.rb'

RSpec.describe do
  describe '.intcode_process' do
    subject { intcode_process(intcode) }

    context 'case 1' do
      let(:intcode) { [1,9,10,3,2,3,11,0,99,30,40,50] }
      it { is_expected.to eq([3500,9,10,70,2,3,11,0,99,30,40,50
])}
    end

    context 'case 2' do
      let(:intcode) { [1,0,0,0,99] }
      it { is_expected.to eq([2,0,0,0,99])}
    end

    context 'case 3' do
      let(:intcode) { [2,3,0,3,99] }
      it { is_expected.to eq([2,3,0,6,99])}
    end

    context 'case 4' do
      let(:intcode) { [2,4,4,5,99,0] }
      it { is_expected.to eq([2,4,4,5,99,9801])}
    end

    context 'case 5' do
      let(:intcode) { [1,1,1,4,99,5,6,0,99] }
      it { is_expected.to eq([30,1,1,4,2,5,6,0,99])}
    end
  end
end