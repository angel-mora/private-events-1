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

  context 'Input validation' do
    before { User.create(username: 'tester_user', first_name: 'first', last_name: 'last', email: 'my_email@me.com') }

    it 'is expected to have errors if input values are not present' do
      event = Event.create(title: '', description: '', location: '', date_time: '')
      expect(event.errors.messages[:title]).to eq ["can't be blank"]
      expect(event.errors.messages[:description]).to eq ["can't be blank"]
      expect(event.errors.messages[:location]).to eq ["can't be blank"]
      expect(event.errors.messages[:date_time]).to eq ["can't be blank"]
    end
  end
end
