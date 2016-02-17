require 'rails_helper'

RSpec.describe Grade, :type => :model do
  describe 'grade is valid' do
    let(:grade) do
      build(:grade)
    end

    it 'has a value' do
      expect(grade).to be_valid
    end
  end
end
