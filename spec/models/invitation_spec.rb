require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to User' do
      expect(Invitation.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end

  context 'ActiveRecord associations' do
    it 'belongs to Event' do
      expect(Invitation.reflect_on_association(:event).macro).to be(:belongs_to)
    end
  end
end
