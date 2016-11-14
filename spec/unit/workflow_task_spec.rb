require 'spec_helper'

module Flowr
  describe WorkflowTask do
    let(:subject) { WorkflowTask.new { |*args| 
      args[0] + 1
      }
    }

    describe 'initialization' do
      it 'creates a new WorkflowTask' do
        expect(subject).to_not be_nil
      end
    end

    describe '#perform' do
      context 'when no errors occur' do
        it 'executes the task' do
          expect(subject.perform(nil, 1)).to eq(2)
        end
      end

      context 'when the block is nil' do
        let(:task) { WorkflowTask.new }

        it 'returns nil' do
          expect(task.perform(nil)).to be_nil
        end
      end

      context 'when a precondition has been set' do
        let(:task) { WorkflowTask.new { |*args| 
          args[0] + 1 }
        }

        let(:input) { true }

        before do
          task.add_precondition { |checkval| checkval == true }
        end

        context 'and the precondition has not been met' do
          let(:input) { false }

          it 'does not execute the action and returns nil' do
            expect(task.perform(input, 1)).to eq(nil)
          end
        end

        context 'and the precondition has been met' do
          let(:input) { true }

          it 'executes the action' do
            expect(task.perform(input, 1)).to eq(2)
          end
        end
      end
    end
  end
end