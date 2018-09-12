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
end
