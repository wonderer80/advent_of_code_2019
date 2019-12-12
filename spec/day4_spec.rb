require 'rspec'
require_relative '../day4.rb'

RSpec.describe do
  describe '.next_criteria' do
    subject { find_next_criteria(criteria) }

    context 'case 1' do
      let(:criteria) { 12 }
      it { is_expected.to eq(13) }
    end

    context 'case 2' do
      let(:criteria) { 19 }
      it { is_expected.to eq(22) }
    end

    context 'case 3' do
      let(:criteria) { 199 }
      it { is_expected.to eq(222) }
    end

    context 'case 4' do
      let(:criteria) { 99 }
      it { is_expected.to eq(111) }
    end
  end

  describe '.normalize_criteria' do
    subject { normalize_criteria(criteria) }

    context 'case 1' do
      let(:criteria) { 12 }
      it { is_expected.to eq(12) }
    end

    context 'case 2' do
      let(:criteria) { 21 }
      it { is_expected.to eq(22) }
    end
  end

  describe '.include_adjacent_digits?' do
    subject { include_adjacent_digits?(number) }

    context 'case 1' do
      let(:number) { 12 }
      it { is_expected.to eq(false) }
    end

    context 'case 2' do
      let(:number) { 11 }
      it { is_expected.to eq(true) }
    end
  end

  describe '.include_adjacent_digits2?' do
    subject { include_adjacent_digits2?(number) }

    context 'case 1' do
      let(:number) { 12 }
      it { is_expected.to eq(false) }
    end

    context 'case 2' do
      let(:number) { 11 }
      it { is_expected.to eq(true) }
    end

    context 'case 3' do
      let(:number) { 112233 }
      it { is_expected.to eq(true) }
    end

    context 'case 4' do
      let(:number) { 123444 }
      it { is_expected.to eq(false) }
    end

    context 'case 5' do
      let(:number) { 111122 }
      it { is_expected.to eq(true) }
    end
  end
end