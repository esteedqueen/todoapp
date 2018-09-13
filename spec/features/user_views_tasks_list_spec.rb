require 'rails_helper'

feature 'User views tasks list' do
  scenario 'can view list of uncompleted tasks' do
    create_tasks

    visit root_path

    expect(page).to have_content('Task list')
    within '.uncompleted-tasks' do
      expect(page).to have_content('Write that article')
      expect(page).to have_content('Buy groceries')
      expect(page).to have_button('Add task')
    end
  end

  scenario 'can view list of completed tasks' do
    create_tasks

    visit root_path

    expect(page).to have_content('Completed tasks')
    within '.completed-tasks' do
      expect(page).to have_content('Do yoga')
      expect(page).to have_content('Attend sprint planning session')
    end
  end

  def create_tasks
    create(:task, description: 'Write that article', status: 'uncompleted')
    create(:task, description: 'Buy groceries', status: 'uncompleted')
    create(:task, description: 'Do yoga', status: 'completed')
    create(:task, description: 'Attend sprint planning session', status: 'completed')
  end
end
