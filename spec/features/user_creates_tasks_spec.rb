require 'rails_helper'

feature 'User creates a task' do
  scenario 'successfully with valid data' do
    visit root_path

    expect do
      fill_in 'Description', with: 'Buy eggs'
      click_button 'Add task'
    end.to change(Task, :count).by(1)
    task = Task.last

    expect(task).to_not be_nil
    expect(task.status).to eq('uncompleted')
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Task created')
  end

  scenario 'unsuccessfully with invalid data' do
    visit root_path

    expect do
      fill_in 'Description', with: nil
      click_button 'Add task'
    end.to change(Task, :count).by(0)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("can't be blank")
  end
end
