require 'rails_helper'

feature 'User views tasks list' do
  scenario 'can view list of uncompleted tasks' do
    create(:task, description: 'Write that article', status: 'uncompleted')
    create(:task, description: 'Buy groceries', status: 'uncompleted')
    visit root_path

    expect(page).to have_content('Task list')
    expect(page).to have_content('Write that article')
    expect(page).to have_content('Buy groceries')
    expect(page).to have_button('Add task')
  end
end
