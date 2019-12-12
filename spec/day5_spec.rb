require 'rspec'
require_relative '../day5.rb'

RSpec.describe do
  describe '.create_instruction' do
    subject { create_instruction(instruction_code) }

    context 'case 1' do
      let(:instruction_code) { 1002 }

      it do
        expect(subject.opcode).to eq(2)
        expect(subject.first_parameter_mode).to eq(0)
        expect(subject.second_parameter_mode).to eq(1)
        expect(subject.third_parameter_mode).to eq(0)
      end
    end

    context 'case 2' do
      let(:instruction_code) { 3 }

      it do
        expect(subject.opcode).to eq(3)
        expect(subject.first_parameter_mode).to eq(0)
        expect(subject.second_parameter_mode).to eq(0)
        expect(subject.third_parameter_mode).to eq(0)
      end
    end
  end
end

