require "task_list"
require "task"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context 'we want to check if all tasks are complete' do
    it 'returns false if no tasks are marked complete' do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      expect(task_list.all_complete?).to eq false
    end

    it 'returns false if some but not all tasks are marked complete' do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_1.mark_complete
      expect(task_list.all_complete?).to eq false
    end

    it 'returns true if all tasks are marked complete' do
      task_list = TaskList.new
      task_1 = Task.new("Walk the dog")
      task_2 = Task.new("Walk the cat")
      task_list.add(task_1)
      task_list.add(task_2)
      task_1.mark_complete
      task_2.mark_complete
      expect(task_list.all_complete?).to eq true
    end
  end
end
