require 'rspec'
require_relative '../day1.rb'

RSpec.describe do
  describe '.calc_fuel' do
    subject { calc_fuel(mass) }

    context 'mass of 12' do
      let(:mass) { 12 }
      it { is_expected.to be(2) }
    end

    context 'mass of 14' do
      let(:mass) { 14 }
      it { is_expected.to be(2) }
    end

    context 'mass of 1969' do
      let(:mass) { 1969 }
      it { is_expected.to be(654) }
    end

    context 'mass of 100756' do
      let(:mass) { 100756 }
      it { is_expected.to be(33583) }
    end
  end

  describe '.recursive_calc_fuel' do
    subject { recursive_calc_fuel(mass) }

    context 'mass of 14' do
      let(:mass) { 14 }
      it { is_expected.to be(2) }
    end

    context 'mass of 1969' do
      let(:mass) { 1969 }
      it { is_expected.to be(966) }
    end

    context 'mass of 100756' do
      let(:mass) { 100756 }
      it { is_expected.to be(50346) }
    end
  end
end