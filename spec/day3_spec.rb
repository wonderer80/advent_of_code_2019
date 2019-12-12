require 'rspec'
require_relative '../day3.rb'

RSpec.describe do
  describe '.find_min_distance' do
    subject { find_min_distance(path1, path2) }

    context 'case 1' do
      let(:path1) { 'R8,U5,L5,D3' }
      let(:path2) { 'U7,R6,D4,L4' }
      it { is_expected.to eq(6) }
    end

    context 'case 2' do
      let(:path1) { 'R75,D30,R83,U83,L12,D49,R71,U7,L72' }
      let(:path2) { 'U62,R66,U55,R34,D71,R55,D58,R83' }
      it { is_expected.to eq(159) }
    end

    context 'case 3' do
      let(:path1) { 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51' }
      let(:path2) { 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7' }
      it { is_expected.to eq(135) }
    end
  end

  describe '.find_the_fewest_steps' do
    subject { find_the_fewest_steps(path1, path2) }

    context 'case 1' do
      let(:path1) { 'R8,U5,L5,D3' }
      let(:path2) { 'U7,R6,D4,L4' }
      it { is_expected.to eq(30) }
    end

    context 'case 2' do
      let(:path1) { 'R75,D30,R83,U83,L12,D49,R71,U7,L72' }
      let(:path2) { 'U62,R66,U55,R34,D71,R55,D58,R83' }
      it { is_expected.to eq(610) }
    end

    context 'case 3' do
      let(:path1) { 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51' }
      let(:path2) { 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7' }
      it { is_expected.to eq(410) }
    end
  end
end