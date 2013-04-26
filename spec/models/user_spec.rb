require 'spec_helper'

describe User do
  describe 'create new user' do
    let(:user) {User.create(email: '1@g.com', username: 'ballerz', password: '1', password_confirmation: '1')}
    it 'can successfully create a new user' do
      user.should_not be_new_record
    end

    it '' do

    end
  end
end
