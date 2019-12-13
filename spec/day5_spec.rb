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

  describe '.intcode_process' do
    subject { intcode_process(intcode, input) }

    context 'case 1' do
      let(:intcode) { [3,9,8,9,10,9,4,9,99,-1,8] }
      context 'input is equal to 8' do
        let(:input) { 8 }
        it { expect { subject }.to output("1\n").to_stdout }
      end

      context 'input is not equal to 8' do
        let(:input) { 9 }
        it { expect { subject }.to output("0\n").to_stdout }
      end
    end


    context 'case 2' do
      let(:intcode) { [3,9,7,9,10,9,4,9,99,-1,8] }
      context 'input is less than 8' do
        let(:input) { 7 }
        it { expect { subject }.to output("1\n").to_stdout }
      end

      context 'input is not less than 8' do
        let(:input) { 9 }
        it { expect { subject }.to output("0\n").to_stdout }
      end
    end

    context 'case 3' do
      let(:intcode) { [3,3,1108,-1,8,3,4,3,99] }
      context 'input is equal to 8' do
        let(:input) { 8 }
        it { expect { subject }.to output("1\n").to_stdout }
      end

      context 'input is not equal to 8' do
        let(:input) { 9 }
        it { expect { subject }.to output("0\n").to_stdout }
      end
    end

    context 'case 4' do
      let(:intcode) { [3,3,1107,-1,8,3,4,3,99] }
      context 'input is less than 8' do
        let(:input) { 7 }
        it { expect { subject }.to output("1\n").to_stdout }
      end

      context 'input is not less than 8' do
        let(:input) { 9 }
        it { expect { subject }.to output("0\n").to_stdout }
      end
    end

    context 'case 5' do
      let(:intcode) { [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9] }
      context 'input is equal to 0' do
        let(:input) { 0 }
        it { expect { subject }.to output("0\n").to_stdout }
      end

      context 'input is not equal to 0' do
        let(:input) { 9 }
        it { expect { subject }.to output("1\n").to_stdout }
      end
    end

    context 'case 6' do
      let(:intcode) { [3,3,1105,-1,9,1101,0,0,12,4,12,99,1] }
      context 'input is equal to 0' do
        let(:input) { 0 }
        it { expect { subject }.to output("0\n").to_stdout }
      end

      context 'input is not equal to 0' do
        let(:input) { 9 }
        it { expect { subject }.to output("1\n").to_stdout }
      end
    end

    context 'case 7' do
      let(:intcode) { [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
                       1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
                       999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99] }
      context 'input is below 8' do
        let(:input) { 7 }
        it { expect { subject }.to output("999\n").to_stdout }
      end

      context 'input is equal to 8' do
        let(:input) { 8 }
        it { expect { subject }.to output("1000\n").to_stdout }
      end

      context 'input is greater than 8' do
        let(:input) { 9 }
        it { expect { subject }.to output("1001\n").to_stdout }
      end
    end
  end
end

