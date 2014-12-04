require 'spec_helper'

module GameOfLife
  describe GameOfLife do
    
    describe '#hello' do
      it 'prints out hello' do
        expect(GameOfLife.hello).to eq "hello"
      end
    end
    
  end
end
