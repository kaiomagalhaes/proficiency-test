require 'rails_helper'

RSpec.describe Subject, :type => :model do
  describe 'subject is valid' do
    let(:subject) do
      build(:subject)
    end

    it 'has a name' do
      expect(subject).to be_valid
    end
  end
end
