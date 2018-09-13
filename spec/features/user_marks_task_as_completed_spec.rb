require 'rails_helper'

feature 'User completes task' do
  scenario 'can mark task as completed' do
    create(:task, description: 'Write that article', status: 'uncompleted')
    create(:task, description: 'Buy groceries', status: 'uncompleted')
    visit root_path

    first('.task-item').click_button('Complete')

    within '.uncompleted-tasks' do
      expect(page).not_to have_content('Write that article')
      expect(page).to have_content('Buy groceries')
    end


    within '.completed-tasks' do
      expect(page).to have_content('Write that article')
    end
  end
end
