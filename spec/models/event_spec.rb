require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to creator' do
      expect(Event.reflect_on_association(:creator).macro).to be(:belongs_to)
    end
  end

  context 'ActiveRecord associations' do
    it 'has many invitations' do
      expect(Event.reflect_on_association(:invitations).macro).to be(:has_many)
    end
  end

  context 'ActiveRecord associations' do
    it 'has many attendees' do
      expect(Event.reflect_on_association(:attendees).macro).to be(:has_many)
    end
  end
end
