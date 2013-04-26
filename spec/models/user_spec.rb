# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  describe 'create new user' do
    let(:attributes) { { email: '1@g.com', username: 'ballerz', password: '1', password_confirmation: '1' } }
    let(:user) { User.new(attributes) }
    

    context 'validation' do
      it 'can successfully create a new user' do
        user.save.should be_true
      end

      it 'should not be valid without an email' do
        user.email = ""
        user.should_not be_valid
      end

      it 'should not be valid without a valid email' do
        invalid_emails = %w(a a.com ten@email)
        invalid_emails.each do |i|
          user.email = i
          user.should_not be_valid
        end
      end

      it 'should not allow duplicate email' do
        user.save
        attributes[:username] = "Different"
        User.new(attributes).should_not be_valid
      end

      it 'should not be valid without a username' do
        user.username = ""
        user.should_not be_valid
      end

      it 'should not allow duplicate username' do
        user.save
        attributes[:email] = "Test@theright.thing"
        User.new(attributes).should_not be_valid
      end

      it 'should not be valid without a password' do
        user.password = ""
        user.should_not be_valid
      end

      it 'should not be valid without a matching confirmation' do
        user.password_confirmation = ""
        user.should_not be_valid
      end

      it 'should raise error with a wrong confirmation' do
        user.password_confirmation = "It's different"
        user.should_not be_valid
      end
    end

    context 'associations' do
      it { should have_many(:stories) }
    end

    context 'attribute accessibles' do
      it { should_not allow_mass_assignment_of(:password_digest) }
      it { should_not allow_mass_assignment_of(:id) }
      it { should allow_mass_assignment_of(:email) }
      it { should allow_mass_assignment_of(:username) }
      it { should allow_mass_assignment_of(:password) }
      it { should allow_mass_assignment_of(:password_confirmation) }
    end

    context 'instance methods' do
      it { should respond_to(:has_voted_on?) }
      it { should respond_to(:authenticate) }

      describe 'has_voted_on' do
        before do
          user.save
        end
        
        it "should return true if vote for object exists" do
          image_vote = FactoryGirl.create(:image_vote, user: user)
          image = image_vote.votable
          user.has_voted_on?(image).should be_true
        end

        it "should return false if vote for object does not exists" do
          image_vote = FactoryGirl.create(:image_vote)
          image = image_vote.votable
          user.has_voted_on?(image).should be_false
        end

       # it "should return true if vote for object exist" do
        #   #we're trying to practice decoupling and keeping our dependencies down. Not sure if it's possible
        #   vote = mock_model('Vote', {
        #     :user_id => user.id,
        #     :votable_type => 'Image',
        #     :votable_id => 1
        #     } )

        #   image = mock_model('Image', {
        #     :id => 1,
        #     :votes => [vote],
        #     :class => 'Image'
        #   })

        #   user.has_voted_on?(image).should be_true
        # end
      end

      describe 'authenticate' do
        before do
          user.save
        end

        it "should return user with the right password" do
          user.authenticate(user.password).should eq(user)
        end

        it "should return false with the wrong password" do
          user.authenticate("Wrong password").should be_false
        end
      end
    end

  end
end
