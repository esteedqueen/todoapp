require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end

  it 'has a valid data' do
    expect(build(:task)).to be_valid
  end

  it 'has an invalid data' do
    expect(build(:task, description: nil)).to_not be_valid
  end

  describe '.completed' do
    it 'returns completed tasks' do
      task1 = FactoryBot.create(:task, status: 'completed')
      task2 = FactoryBot.create(:task, status: 'uncompleted')
      task3 = FactoryBot.create(:task, status: 'completed')

      tasks = Task.completed

      expect(tasks).to include(task1)
      expect(tasks).to include(task3)
      expect(tasks).to_not include(task2)
    end
  end

  describe '.uncompleted' do
    it 'returns uncompleted tasks' do
      task1 = FactoryBot.create(:task, status: 'uncompleted')
      task2 = FactoryBot.create(:task, status: 'uncompleted')
      task3 = FactoryBot.create(:task, status: 'completed')

      tasks = Task.uncompleted

      expect(tasks).to include(task1)
      expect(tasks).to include(task2)
      expect(tasks).to_not include(task3)
    end
  end
end
