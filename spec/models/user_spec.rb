require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Input validation' do
    it 'it is invalid without valid user input' do
      new_user = User.create(username: '', first_name: '', last_name: '', email: '')
      expect(new_user.errors.messages[:username]).to eq ["can't be blank"]
      expect(new_user.errors.messages[:first_name]).to eq ["can't be blank"]
      expect(new_user.errors.messages[:last_name]).to eq ["can't be blank"]
      expect(new_user.errors.messages[:email]).to eq ["can't be blank"]
    end

    it 'should have unique email and username' do
      User.create(username: 'name', first_name: 'farst', last_name: 'larst', email: 'myemail@gmail.com')
      new_user_two = User.create(username: 'name', first_name: 'first', last_name: 'last', email: 'myemail@gmail.com')
      expect(new_user_two.errors.messages[:username]).to eq ['has already been taken']
      expect(new_user_two.errors.messages[:email]).to eq ['has already been taken']
    end
  end

  context 'ActiveRecord associations' do
    it 'has many events' do
      expect(User.reflect_on_association(:events).macro).to be(:has_many)
    end
  end

  context 'ActiveRecord associations' do
    it 'has many invitations' do
      expect(User.reflect_on_association(:invitations).macro).to be(:has_many)
    end
  end

  context 'ActiveRecord associations' do
    it 'has many attended_events' do
      expect(User.reflect_on_association(:attended_events).macro).to be(:has_many)
    end
  end
end
