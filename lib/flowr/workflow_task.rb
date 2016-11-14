module Flowr
  class WorkflowTask
    def initialize(&blk)
      @blk = blk if blk
      @preconditions = []
    end
    
    def add_precondition(&blk)
      preconditions << blk if blk
    end

    # perform - return true on success.
    def perform(checkval, *args)
      if preconditions.length > 0
        preconditions.each do |check|
          return nil unless check.call(checkval)
        end
      end
      return @blk.call(*args) if @blk
      nil
    end

    private

    attr_accessor :preconditions
  end
end