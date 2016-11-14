require 'spec_helper'

module Flowr
  describe Workflow do
    describe '#add_task' do
    end

    describe 'perform' do
      it 'does not raise an error' do
        expect { subject.perform }.to_not raise_error
      end
    end
  end
end