module Flowr
  class Workflow
    def initialize
      @task_list = []
    end

    def add_task(task)
      task_list << task if task
    end

    def perform
      raise
    end

    private

    attr_accessor :task_list
  end
end